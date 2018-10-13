source /Users/lillyel-said/Desktop/stanford/scripts/bash/source_fxns.sh

echo "Enter in order specified:

subject ID (####),
rc_id (all digits),
timepoint (1 digit),
group = hv or patient,
series_number = structural series number (###)

example: ./porcupine_run.sh 1000 23001 2 patient 005"
subj_id=$1
rc_id=$2
tp=$3
group=$4
series_number=$5


main_mri_dir=/Volumes/quincy/mri_dicoms/
visor_dir=~/Documents/MATLAB/scripts//VisorTargeting


#best_vault=/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd/
#main_mri_dir=/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd/fmri
#porcupine_submit=/Volumes/Smurf-Village/Imaging/best_ptsd/VisorTargeting/submit_porcupine.txt
#visor_dir=/Volumes/Smurf-Village/Imaging/best_ptsd/VisorTargeting
#mkdir ${best_vault}/tms_eeg/${group}/tp${tp}/${tms_dir};

subj_tms_dir=${best_vault}/tms_eeg/${group}/tp${tp}/${tms_dir}
rc_id_valid=`echo $rc_id | cut -b 1-4`
subj_id_mri=best_${subj_id}_tp${tp}_fmri
tms_dir=best_${subj_id}_tp${tp}_tms_eeg

visor_id=BEST_${subj_id}_RC${rc_id_valid}
visor_input_nii=${visor_id}_T1.nii
final_subj_id=best_${subj_id}_tp${tp}_rc${rc_id}_porcupine


#num_efiles=`ls ${main_mri_dir}/${group}/${tp}/E* | wc -l`

mri_convert ${main_mri_dir}/${group}/tp${tp}/${subj_id_mri}/sag*bravo_8channel/${series_number}/I0001.dcm ${visor_dir}/InputT1/${visor_input_nii}

cd /Users/lillyel-said/Documents/MATLAB/scripts/VisorTargeting/; ./porcupine.sh
#/Volumes/Smurf-Village/home/daelsaid/submit_porcupine.txt fsl_sub -q rush.q -N best_porcupine submit_porcupine.sh fsl_sub -q rush.q -N best_porcupine submit_porcupine.sh


subj_complete=`ls ${visor_dir}/Output/ | grep BEST_${subj_id} | wc -l`


if [ $subj_complete -gt 0 ]; then
	cd $visor_dir/Output/${visor_id}_PORCUPINE; make_lower; echo `rename_dirs best_${subj_id}_rc${rc_id_valid} best_${subj_id}_tp${tp}_rc${rc_id} 2> /dev/null`; for dir in `ls -d BEST*_*`; do cd $dir; make_lower; echo `rename_dirs best_${subj_id}_rc${rc_id_valid} best_${subj_id}_tp${tp}_rc${rc_id} 2> /dev/null`; cd $visor_dir/Output/${visor_id}_PORCUPINE; mv BEST_*STRAW best_${subj_id}_tp${tp}_rc${rc_id}_straw; mv BEST_*ICD best_${subj_id}_tp${tp}_rc${rc_id}_icd; cd ${visor_dir}/Output; mv ${visor_id}_PORCUPINE $final_subj_id; 2> /dev/null;done
	#ionice -c 2 -n 3 zip -vr ${subj_tms_dir}/$final_subj_id.zip $final_subj_id
	zip -vr $final_subj_id.zip $final_subj_id
else
	pid=0
	while [ pid -eq 0 ]
	do
		ps -ef | grep "/Applications/MATLAB" | grep -v grep > /dev/null
		pid=`echo $!`
		sleep 10
	done
fi