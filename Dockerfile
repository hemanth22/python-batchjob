# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Set working directory
WORKDIR /app

# Install Python 3.9 and Ansible
RUN dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip --user && \
    python3.9 -m pip install ansible --user

# Copy all localhost files to the container
COPY . .

# Set environment variables
ENV PATH="/root/.local/bin:${PATH}"

# Execute the Ansible playbook
CMD ["ansible-playbook", "-vvv", "ansible.playbook"]
