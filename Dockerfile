# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

USER root

WORKDIR /root

# Install Python 3.9 and Ansible
RUN dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install ansible

# Install Ansible Galaxy collections
RUN ansible-galaxy collection install community.general
RUN ansible-galaxy collection install ansible.posix

# Set environment variables
ENV PATH="/root/.local/bin:${PATH}"
ENV ANSIBLE_TMP="/root/.ansible/tmp"

# Create the Ansible temporary directory
RUN mkdir -p $ANSIBLE_TMP && chown -R root:root $ANSIBLE_TMP && chmod -R 777 /root/.ansible/tmp

# Copy all localhost files to the container
COPY . /root/

# Execute the Ansible playbook
CMD ["ansible-playbook", "batchjob.playbook"]
