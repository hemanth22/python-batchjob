#!/bin/bash -xv
echo "[TASK 1] Install python modules from requirements files"
python3 -m pip install --no-cache-dir -r requirements.txt
echo "[TASK 2] Print Python3 Verions"
python3 -V
touch batchjob1.txt
chmod 755 batchjob1.txt
touch batchjob1.html
chmod 755 batchjob1.html
echo "[TASK 2.1] Configure python and python3"
alternatives --set python3 /usr/bin/python3.9
alternatives --set python /usr/bin/python3.9
echo "[TASK 3] Executing Batch Jobs"
python3 batchjob1.py > batchjob1.txt
echo "[TASK 4] Transform output to html format"
cat batchjob1.txt | awk -f converter_html.awk > batchjob1.html
echo "[TASK 5] Mail the output"
python3 mail_batchjob1.py
