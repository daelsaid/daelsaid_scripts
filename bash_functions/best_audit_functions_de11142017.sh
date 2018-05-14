#!/bin/bash


function best_behav_audit () {
	for group in "$@"; do 
		best_data_output_dir='/Volumes/Smurf-Village/Imaging/best_ptsd/data' 
		output_csv=`echo 'best_behav_audit_'`${group}_`date "+%Y_%m_%d"`.csv
		best_weekly_audit_output=/Volumes/Smurf-Village/Imaging/best_ptsd/admin/audits
		best_dir=/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd

		cd $best_dir
		for subj in `for file in \`ls -d  ${best_dir}/*/${group}/tp*/best*\`; do echo $(basename $file) | cut -d_ -f1-3; done | sort -u`; do color_dry=`ls dry_eeg/${group}/tp*/${subj}*/*color*/*color*.txt dry_eeg/${group}/tp*/${subj}*/*color*/*color*.psydat 2>/dev/null | wc -l`; color_saline=`ls saline_eeg/${group}/tp*/${subj}*/*color*/*2342*.txt saline_eeg/${group}/tp*/${subj}*/*color*/*color*.psydat 2>/dev/null | wc -l`; emo=`ls saline_eeg/${group}/tp*/${subj}*/*emo*/*estroop*.txt saline_eeg/${group}/tp*/${subj}*/*emo*/*emoconflict*.psydat 2>/dev/null | wc -l`; color_fmri=`ls fmri/*/tp*/${subj}*/*color*/*eegfmri*color*.txt 2> /dev/null | wc -l`; rest_fmri=`ls fmri/*/tp*/${subj}*/*rest*/*eegfmri*rest*.txt 2> /dev/null | wc -l`; color_efmri=`ls eeg_fmri/*/tp*/${subj}*/*color*/*eegfmri*color*.txt 2>/dev/null | wc -l`; rest_efmri=`ls eeg_fmri/*/tp*/${subj}*/*rest*/*eegfmri*rest*.txt 2> /dev/null | wc -l`; 
			if [[ "${group}" == 'hv' ]]
				then 
				echo $subj $(basename $color_dry) $(basename $color_saline) $(basename $emo) $(basename $color_fmri) $(basename $rest_fmri) >> ${best_weekly_audit_output}/${output_csv};
			elif [[ "${group}" == 'patient' ]]
				then 
					echo $subj $(basename $color_dry) $(basename $color_saline) $(basename $emo) $(basename $color_fmri) $(basename $rest_fmri) >> ${best_weekly_audit_output}/${output_csv}
			else 
				echo $subj $(basename $color_dry) $(basename $color_saline) $(basename $color_efmri) $(basename $rest_efmri) >> ${best_weekly_audit_output}/${output_csv}; 
			fi
		done
	done
}


function best_raw_data_audit () {
	for group in "$@"; do 
		best_data_output_dir='/Volumes/Smurf-Village/Imaging/best_ptsd/data' 
		output_csv=`echo 'best_raw_data_audit_'`${group}_`date "+%Y_%m_%d"`.csv
		best_weekly_audit_output=/Volumes/Smurf-Village/Imaging/best_ptsd/admin/audits
		best_dir=/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd

		for subj in `for file in \`ls -d  ${best_dir}/*/${group}/tp*/best*\`; do echo $(basename $file) | cut -d_ -f1-3; done | sort -u`; do
			dry_rs1=`ls -d dry_eeg/${group}/tp*/${subj}*/*rs1* dry_eeg/${group}/tp*/${subj}*/*resting_state_1* 2>/dev/null | wc -l`; dry_rs2=`ls -d dry_eeg/${group}/tp*/${subj}*/*rs2* dry_eeg/${group}/tp*/${subj}*/*resting_state_2* 2>/dev/null | wc -l`; dry_color=`ls -d dry_eeg/${group}/tp*/${subj}*/*color_id 2>/dev/null | wc -l`; saline_rs1=`ls -d saline_eeg/${group}/tp*/${subj}*/*rs1* saline_eeg/${group}/tp*/${subj}*/*resting_state_1* 2>/dev/null | wc -l`; saline_rs2=`ls -d saline_eeg/${group}/tp*/${subj}*/*rs2* saline_eeg/${group}/tp*/${subj}*/*resting_state_2* 2>/dev/null | wc -l`; saline_emo=`ls -d saline_eeg/${group}/tp*/${subj}*/*color_id | wc -l` `ls -d saline_eeg/${group}/tp*/${subj}*/*emoconflict 2>/dev/null | wc -l`; fmri_rs1=`ls -d fmri/*/tp*/${subj}*/resting_state_1* 2>/dev/null | wc -l`; fmri_rs2=`ls -d fmri/*/tp*/${subj}*/resting_state_2* 2>/dev/null | wc -l`; fmri_appa=`ls -d fmri/*/tp*/${subj}*/*20vol 2>/dev/null | wc -l`; fmri_b0=`ls -d fmri/*/tp1/${subj}*/b0* 2>/dev/null | wc -l`; fmri_color=`ls -d fmri/*/tp1/${subj}*/color* 2>/dev/null | wc -l`; fmri_fspgr=`ls -d fmri/*/tp1/${subj}*/sag* 2>/dev/null | wc -l`; eeg_fmri_rs1=`ls -d eeg_fmri/${group}/tp*/${subj}*/resting_state_1* 2>/dev/null | wc -l`; eeg_fmri_rs2=`ls -d eeg_fmri/${group}/tp*/${subj}*/resting_state_2* 2>/dev/null | wc -l`; eeg_fmri_appa=`ls -d eeg_fmri/${group}/tp*/${subj}*/*20vol 2>/dev/null | wc -l`; eeg_fmri_b0=`ls -d eeg_fmri/${group}/tp*/${subj}*/b0* 2>/dev/null | wc -l`; eeg_fmri_color=`ls -d eeg_fmri/${group}/tp*/${subj}*/color* 2>/dev/null | wc -l`; eeg_fmri_struct=`ls -d eeg_fmri/${group}/tp*/${subj}*/sag* 2>/dev/null | wc -l`; efmri_eeg_mff=`ls -d eeg_fmri/*/tp*/${subj}*/eeg_data/${subj}*.mff 2>/dev/null | wc -l`; tms_recreo=`ls -d tms_eeg/*/tp*/${subj}*/*recreo* tms_eeg/${group}/tp*/${subj}*/*rec tms_eeg/${group}/tp*/${subj}*/*reo 2>/dev/null | wc -l`; tms_sptms=`ls -d tms_eeg/${group}/tp*/${subj}*/*sptms*.eeg tms_eeg/*/tp*/${subj}*/*spTMS*.eeg 2>/dev/null | wc -l`; tms_markers=`for site in \`ls -d tms_eeg/${group}/tp*/${subj}*/*_sptms.vmrk ls -d tms_eeg/${group}/tp*/${subj}*/*_spTMS.vmrk \`; do cat tms_eeg/${group}/tp*/${subj}*/*_sptms.vmrk  tms_eeg/${group}/tp*/${subj}*/*_spTMS.vmrk 2>/dev/null | grep Comment | awk -F, '{ print $2 }' | sort -u; done`; pt=`echo $(basename $dry_rs1) $(basename $dry_rs2) $(basename $dry_color) $(basename $saline_rs1) $(basename $saline_rs2) $(basename $saline_color) $(basename $saline_emo) $(basename $fmri_rs1) $(basename $fmri_rs2) $(basename $fmri_rs1) $(basename $fmri_rs2) $(basename $fmri_color) $(basename $fmri_appa) $(basename $fmri_b0) $(basename $fmri_fspgr) $(basename $tms_recreo) $(basename $tms_sptms) $tms_markers 2>/dev/null`; hvet=`echo $(basename $dry_rs1) $(basename $dry_rs2) $(basename $dry_color) $(basename $saline_rs1) $(basename $saline_rs2) $(basename $saline_color) $(basename $saline_emo) $(basename $fmri_rs1) $(basename $fmri_rs2) $(basename $fmri_color) $(basename $fmri_appa) $(basename $fmri_b0) $(basename $fmri_fspgr) $(basename $tms_recreo) $(basename $tms_sptms) $tms_markers 2>/dev/null`; hcontrol=`$(basename $dry_rs1) $(basename $dry_rs2) $(basename $dry_color) $(basename $saline_rs1) $(basename $saline_rs2) $(basename $saline_color) $(basename $saline_emo) $(basename $eeg_fmri_rs1) $(basename $eeg_fmri_rs2) $(basename $eeg_fmri_color) $(basename $eeg_fmri_appa) $(basename $eeg_fmri_b0) $(basename $eeg_fmri_fspgr) $(basename $efmri_eeg_mff) 2>/dev/null`;  
			if  [[ "${group}" == 'patient' ]]
				then 
					echo $subj $pt >> ${best_weekly_audit_output}/${output_csv};
			elif [[ "${group}" == 'hv' ]]
				then
					echo $subj $hvet >> ${best_weekly_audit_output}/${output_csv};
			else
				echo $subj $hcontrol >> ${best_weekly_audit_output}/${output_csv};
			fi
		done
	done | sort |  column -c 40 
}


# function best_raw_data_audit () {
# 	group="$@"

# 	best_data_output_dir='/Volumes/Smurf-Village/Imaging/best_ptsd/data' 
# 	output_csv=`echo 'best_behav_audit_'`${group}_`date "+%Y_%m_%d"`.csv
# 	best_weekly_audit_output=/Volumes/Smurf-Village/Imaging/best_ptsd/admin/audits
# 	best_dir=/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd

# 	cd $best_dir
# 	for subj in `for file in \`ls -d  ${best_dir}/*/${group}/tp*/best*\`; do echo $(basename $file) | cut -d_ -f1-3; done | sort -u`; do echo $subj `ls -d dry_eeg/${group}/tp*/${subj}*/*rs1* dry_eeg/${group}/tp*/${subj}*/*resting_state_1* | wc -l` `ls -d dry_eeg/${group}/tp*/${subj}*/*rs2* dry_eeg/${group}/tp*/${subj}*/*resting_state_2*| wc -l` `ls -d dry_eeg/${group}/tp*/${subj}*/*color_id | wc -l` `ls -d saline_eeg/${group}/tp*/${subj}*/*rs1* saline_eeg/${group}/tp*/${subj}*/*resting_state_1* | wc -l` `ls -d saline_eeg/${group}/tp*/${subj}*/*rs2* saline_eeg/${group}/tp*/${subj}*/*resting_state_2*| wc -l` `ls -d saline_eeg/${group}/tp*/${subj}*/*color_id | wc -l` `ls -d saline_eeg/${group}/tp*/${subj}*/*emoconflict | wc -l` `ls -d fmri/*/tp*/${subj}*/resting_state_1* | wc -l` `ls -d fmri/*/tp*/${subj}*/resting_state_2* | wc -l` `ls -d fmri/*/tp*/${subj}*/*20vol | wc -l` `ls -d fmri/*/tp1/${subj}*/b0* | wc -l` `ls -d fmri/*/tp1/${subj}*/color* | wc -l` `ls -d fmri/*/tp1/${subj}*/sag* | wc -l` `ls -d tms_eeg/*/tp*/${subj}*/*recreo* tms_eeg/${group}/tp*/${subj}*/*rec tms_eeg/${group}/tp*/${subj}*/*reo | wc -l` `ls -d tms_eeg/${group}/tp*/${subj}*/*sptms*.eeg tms_eeg/*/tp*/${subj}*/*spTMS*.eeg | wc -l` `for site in \`ls -d tms_eeg/${group}/tp*/${subj}*/*_sptms.vmrk ls -d tms_eeg/${group}/tp*/${subj}*/*_spTMS.vmrk \`; do cat tms_eeg/${group}/tp*/${subj}*/*_sptms.vmrk  tms_eeg/${group}/tp*/${subj}*/*_spTMS.vmrk 2>/dev/null | grep Comment | awk -F, '{ print $2 }' | sort -u; done`; done | sort |  column -c 40 >> ${subj_data_output_path}/best_data_audit_patient_`date "+%Y_%m_%d"`.csv
# }
