# Use Python 3.10 base image
FROM python:3.10

# Install Ansible
RUN pip install ansible

# Copy the Ansible playbook into the container
COPY . /playbooks/

# Set the working directory
WORKDIR /playbooks

# Set environment variables
ENV PATH="/root/.local/bin:${PATH}"
ENV ANSIBLE_TMP="/root/.ansible/tmp"

# Create the Ansible temporary directory
RUN mkdir -p $ANSIBLE_TMP && chown -R root:root $ANSIBLE_TMP && chmod -R 777 /root/.ansible/tmp

# Execute the Ansible playbook
CMD ["ansible-playbook", "batchjob.playbook"]
