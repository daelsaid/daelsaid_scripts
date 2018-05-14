for target in `ls *.nii | sort`; do coordinates=`fslstats -t $target -x`; echo $target $coordinates; done | xargs -l bash -c "echo \$0 \`expr \$1 \* -2 + 90 \` \`expr \$2 \* 2 - 126 \` \`expr \$3 \* 2 - 72\`"



for target in `ls *.nii | sort`; do coordinates=`fslstats -t $target -x`; echo $target $coordinates; done,