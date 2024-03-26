# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

USER root

WORKDIR /root

# Copy all localhost files to the container
COPY . /root/

# Install Python 3.9 and Ansible
RUN dnf install sudo python39 -y && python3.9 -m pip install --upgrade pip

# Execute the Ansible playbook
CMD ["bash", "batchscript.sh"]
