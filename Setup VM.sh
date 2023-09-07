#Remove docker packages from linux.
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

#Add Docker's official GPG key:
#apt-key is a program that is used to manage a keyring of gpg keys for secure apt.
#gpg is the tool used in secure apt to sign files and check their signatures

#gpg is the tool used in secure apt to sign files and check their signatures
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#change the access permissions -- all permissions to all usser for this file
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Update the apt package index:
sudo apt-get update

#To install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#User permissions

sudo groupadd docker
sudo usermod -aG docker "$(whoami)"
#Ask for reboot first
#--
sudo reboot