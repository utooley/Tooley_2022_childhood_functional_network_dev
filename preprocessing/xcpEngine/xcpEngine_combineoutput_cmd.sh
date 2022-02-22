#command for running the whole cohort as a group to collate output
#!/bin/bash
MACKEY_HOME=/data/picsl/mackey_group
project_dir=/jux/mackey_group/Ursula/projects/in_progress/within_between_network_conn_CBPD
sublist_dir=/data/jux/mackey_group/Ursula/projects/in_progress/within_between_network_conn_CBPD/data/subjectLists
tools_dir=${MACKEY_HOME}/tools/singularity
#tools_dir=/data/joy/BBL/applications/bids_apps

#run this command to start the xcp container interaactively
singularity shell --cleanenv -B /data:/mnt ${tools_dir}/xcpEngine-100219.simg

#then run this command
pipeline=xcpEngine_gsr_spkreg_fd0.5dvars1.75_drpvls
outputdir=/mnt/picsl/mackey_group/BPD/CBPD_bids_crosssectional/derivatives/${pipeline}
${XCPEDIR}/utils/combineOutput \
   -p $outputdir  \
   -f "*quality.csv" \
   -o XCP_QAVARS_${pipeline}.csv \

${XCPEDIR}/utils/combineOutput \
    -p $outputdir  \
    -f "*audit.csv" \
    -o XCP_AUDIT_${pipeline}.csv \
