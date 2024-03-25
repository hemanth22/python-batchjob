# Use CentOS Stream 8 as base image
FROM quay.io/centos/centos:stream8

# Set working directory
WORKDIR /app

# Install sudo
RUN dnf install -y sudo

# Create a non-root user
RUN useradd -ms /bin/bash myuser

# Grant sudo privileges to the non-root user
RUN echo "myuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the non-root user
USER myuser

# Install Python 3.9 and Ansible
RUN sudo dnf install python39 -y && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install ansible --user

# Add Ansible binary directory to PATH
ENV PATH="/home/myuser/.local/bin:${PATH}"

# Copy all localhost files to the container
COPY . .

# Execute the Ansible playbook
CMD ["/home/myuser/.local/bin/ansible-playbook", "-vvv", "/app/ansible.playbook"]
