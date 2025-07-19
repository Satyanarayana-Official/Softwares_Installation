# Official Documentation
```
https://docs.docker.com/engine/install/rhel/
```

## Below Are The Docker Installation Steps


# Installation methods

### Set up the repository
Install the dnf-plugins-core package (which provides the commands to manage your DNF repositories) and set up the repository.

```
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
```

### Install Docker Engine

```
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

### Start Docker Engine.
```
sudo systemctl start docker
```
```
sudo systemctl enable docker
```
```
sudo systemctl status docker
```

### Add your normal user to docker group
```
sudo usermod -aG docker ec2-user
```

### Note: Images, containers, volumes, and networks stored in `/var/lib/docker/` aren't automatically removed when you uninstall Docker.


## Uninstall old versions

```
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc
```

