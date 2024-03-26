#!/bin/bash -xv
echo "[TASK 1] Copy file to tmp directory"
cp -v requirements.txt /tmp
cp -v README.md /tmp
cp -v inventory /tmp
cp -v converter_html.awk /tmp
cp -v batchjob.playbook /tmp
cp -v batchjob1.py /tmp
cp -v ansible.cfg /tmp
cp -v batchscript.sh /tmp
cp -v mail_batchjob1.py /tmp
cp -v Dockerfile /tmp
export ANSIBLE_LOCAL_TEMP=/tmp/ansible_temp
echo "[TASK 2] Print Python3 Verions"
cd /tmp/
ansible-playbook batchjob.playbook