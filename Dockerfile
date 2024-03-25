# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Install Python 3.9 and Ansible
RUN dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install ansible

# Set environment variables
ENV PATH="/root/.local/bin:${PATH}"
ENV ANSIBLE_TMP="/root/.ansible/tmp"

# Create the Ansible temporary directory
RUN mkdir -p $ANSIBLE_TMP && chown -R root:root $ANSIBLE_TMP

# Copy all localhost files to the container
COPY . .

# Execute the Ansible playbook
CMD ["ansible-playbook", "batchjob.playbook"]
