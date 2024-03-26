# Use CentOS Stream 8 as base image
FROM quay.io/rockylinux/rockylinux:8

USER root

WORKDIR /root

# Copy all localhost files to the container
COPY . /root/

# Install Python 3.9 and Ansible
RUN dnf install sudo python39 -y && python3.9 -m pip install --upgrade pip && python3.9 -m pip install --no-cache-dir -r requirements.txt && alternatives --set python3 /usr/bin/python3.9 && alternatives --set python /usr/bin/python3.9

# Execute the Ansible playbook
CMD ["bash", "batchscript.sh"]
