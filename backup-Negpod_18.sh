#!/usr/bin/env bash
#Define the remote server
remote_server="64293e56bc62@64293e56bc62.3a2627c1.alu-cod.online"
remote_dir="/summative/1023-2024j/"
#Source Directory
source_dir="negpod_18-q1"
#Backup Directory
backup_dir="backup-negpod_18-q1"
#create_dir
mkdir "$backup_dir"
#copy content of source_dir
cp -r "$source_dir" "$backup_dir"
#Transfer to the remote server
scp -r "$backup_dir" "$remote_server:$remote_dir"
#Remove the backup from our sandbox
rm -r "$backup_dir"#
echo "The directory has been backed up"
