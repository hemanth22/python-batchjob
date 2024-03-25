# Use Python 3.10 base image
FROM python:3.10

# Install Ansible
RUN pip install ansible

# Copy the Ansible playbook into the container
COPY . /playbooks/

# Set the working directory
WORKDIR /playbooks

# Execute the Ansible playbook
CMD ["ansible-playbook", "batchjob.playbook"]
