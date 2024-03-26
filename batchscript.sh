#!/bin/bash -xv
echo "[TASK 1] Install python modules from requirements files"
python3 -m pip install --no-cache-dir -r requirements.txt
echo "[TASK 2] Print Python3 Verions"
python3 -V
echo "[TASK 2.2] Copy file to tmp directory"
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
echo "[TASK 2.2] Configure python and python3"
alternatives --set python3 /usr/bin/python3.9
alternatives --set python /usr/bin/python3.9
echo "[TASK 3] Executing Batch Jobs"
cd /tmp/
python3 batchjob1.py > batchjob1.txt
echo "[TASK 4] Transform output to html format"
cd /tmp/
cat batchjob1.txt | awk -f converter_html.awk > batchjob1.html
echo "[TASK 5] Mail the output"
cd /tmp/
python3 mail_batchjob1.py
