# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Install Python 3.9 and Ansible
RUN dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install ansible

# Copy all localhost files to the container
COPY . .

# Execute the Ansible playbook
CMD ["ansible-playbook", "ansible.playbook"]
