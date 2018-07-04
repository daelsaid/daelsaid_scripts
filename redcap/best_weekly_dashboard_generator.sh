#!/bin/bash

#to run either full_path_to_script/*script* or if you are in the directory: ./"script name"

#this is a bash script that will run a script that pulls subject scheduling information from a redcap report for the weekly meetings and dashboards
#you have to be connected to stanford's VPN to run this
# you need to have pycurl downloaded as a package 

#.txt file is created in the best admin weekly dashboard directory, if you run the report on the same day it will overwrite the already existing file

python /Volumes/Smurf-Village/home/daelsaid/scripts/redcap_dashboard_generator_10_13_17.py > /Volumes/Smurf-Village/Imaging/best_ptsd/admin/weekly_dashboards/best_weekly_dashboard_`date "+%Y_%m_%d"`.txt

echo "weekly dashboard .txt file can be found here:"
echo "/Volumes/Smurf-Village/Imaging/best_ptsd/admin/weekly_dashboards"
