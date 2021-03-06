#!/bin/sh

#$ -j y
#$ -l h_vmem=20.1G,s_vmem=20G
#$ -q all.q,himem.q
#$ -o /data/jux/mackey_group/Ursula/projects/in_progress/within_between_network_conn_CBPD/output/qsub_output

MACKEY_HOME=/data/picsl/mackey_group/
#BIDS_folder=/data/picsl/mackey_group/BPD/niftis
BIDS_folder=/data/picsl/mackey_group/BPD/CBPD_bids
working_dir=/data/jux/mackey_group/Ursula/projects/in_progress/within_between_network_conn_CBPD/data/mriqc_working
subject=${1}
tools_dir=${MACKEY_HOME}/tools/singularity
output_dir=${BIDS_folder}/derivatives/mriqc_fd_2_mm
echo $subject
echo $BIDS_folder

unset PYTHONPATH;
singularity run --cleanenv -B ${BIDS_folder}:/mnt ${tools_dir}/mriqc-0.14.2.simg \
/mnt/ /mnt/derivatives/mriqc_fd_2_mm \
participant \
-w /mnt/derivatives/fmriprep_wd/ \
--participant_label ${subject} \
--fd_thres 2 \
--no-sub \
--n_procs 10 \

#must bind to a folder that already exists in the container, and must point to data dir not subject dir
