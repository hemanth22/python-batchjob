# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Set working directory
WORKDIR /app

# Install Python 3.9 and Ansible
RUN dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip --user && \
    python3.9 -m pip install ansible --user

# Add Ansible binary directory to PATH
ENV PATH=$HOME/.local/bin/:$PATH PYTHONUNBUFFERED=1 PYTHONIOENCODING=UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 PIP_NO_CACHE_DIR=off

# Copy all localhost files to the container
COPY . .

# Execute the Ansible playbook
CMD ["/root/.local/bin/ansible-playbook", "-vvv", "/app/ansible.playbook"]
