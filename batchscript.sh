#!/bin/bash -xv
echo "[TASK 1] Install python modules from requirements files"
python3 -m pip install -r requirements.txt
echo "[TASK 2] Print Python3 Verions"
python3 -V
echo "[TASK 3] Executing Batch Jobs"
python3 batchjob1.py > batchjob1.txt
echo "[TASK 4] Transform output to html format"
cat batchjob1.txt | awk -f converter_html.awk > batchjob1.html
echo "[TASK 5] Mail the output"
python3 mail_batchjob1.py
