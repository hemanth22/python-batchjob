# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Set working directory
WORKDIR /app

# Install Python 3.9 and Ansible
RUN sudo dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install ansible

# Copy all localhost files to the container
COPY . .

# Execute the Ansible playbook
CMD ["ansible-playbook", "-vvv", "ansible.playbook"]
