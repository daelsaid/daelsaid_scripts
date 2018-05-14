import os 
from glob import glob
from csv import reader,writer
from shutil import copyfile

#data_dir='/Volumes/Smurf-Village/scratch/daelsaid/tms_eeg_mrkr_rename'


#data_dir='/Volumes/Smurf-Vault/Scanner_Data_From_Lucas/best_ptsd/tms_eeg/patient/tp2'
subj_list=sorted([os.path.basename(x) for x in os.path.join(glob(os.path.join(data_dir,'*')))])
data_files=glob(os.path.join(data_dir, '*','*.vmrk'))


print data_files
print os.path.dirname(data_files[0])
print os.path.join(os.path.dirname(data_files[0]),'orig_'+os.path.basename(x))


for file_name in data_files:
	#copyfile(file_name,os.path.join(os.path.dirname(file_name),'orig_'+os.path.basename(file_name)))
	mispellings={
	'R-aMFG':['R-amfg'], 
	'R-LFP':['R-Fp','R-fp','R-LFp'],
	'L-LFP':['L-lFP','L-LFp','L-Fp'],
	'Fz':['fZ', 'fz', 'Fz','FZ'], 
	'R-vmFP':['R-mfp', 'R-mFP','R-vmfp', 'r-VMfp']}
	for key in mispellings.keys():
		for value in mispellings[key]:
			with open(file_name) as f:
				newText=f.read().replace(value,key)
			with open(file_name,'w') as f:
				f.write(newText)


