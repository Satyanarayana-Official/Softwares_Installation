#!/bin/bash

# Install Docker dependencies and add Docker repo
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Install Docker packages
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add ec2-user to Docker group
usermod -aG docker ec2-user

# Expand disk space
growpart /dev/nvme0n1 4

# Extend logical volumes
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

# Resize file systems
xfs_growfs /
xfs_growfs /var