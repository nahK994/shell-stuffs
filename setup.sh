#!/bin/bash

numberOfTasks=18

echo "(1/${numberOfTasks}) Updating apt and apt-get"
sudo apt update -y
sudo apt-get update -y
echo -e "\n\n"

echo "(2/${numberOfTasks}) Upgrading apt and apt-get"
sudo apt upgrade -y
sudo apt-get upgrade -y
echo -e "\n\n"

while true; do
    read -p "(3/${numberOfTasks}) Want to install go? (y/N): " go
    if [[ $go =~ ^[yY]$ ]]; then
        cd ~/Downloads
        wget -O go1.23.0.linux-amd64.tar.gz https://golang.org/dl/go1.23.0.linux-amd64.tar.gz
        sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
        source ~/.profile
        cd ~/
        break
    elif [[ $go =~ ^[nN]$ ]]; then
        echo "go installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(4/${numberOfTasks}) Want to install google chrome? (y/N): " chrome
    if [[ $chrome =~ ^[yY]$ ]]; then
        cd ~/Downloads
        wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb
        cd ~/
        break
    elif [[ $chrome =~ ^[nN]$ ]]; then
        echo "google chome installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(5/${numberOfTasks}) Want to install VLC? (y/N): " vlc
    if [[ $vlc =~ ^[yY]$ ]]; then
        sudo snap install vlc
        break
    elif [[ $vlc =~ ^[nN]$ ]]; then
        echo "VLC installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(6/${numberOfTasks}) Want to install htop? (y/N): " htop
    if [[ $htop =~ ^[yY]$ ]]; then
        sudo snap install htop
        break
    elif [[ $htop =~ ^[nN]$ ]]; then
        echo "htop installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(7/${numberOfTasks}) Want to install tree? (y/N): " tree
    if [[ $tree =~ ^[yY]$ ]]; then
        sudo snap install tree
        break
    elif [[ $tree =~ ^[nN]$ ]]; then
        echo "tree installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(8/${numberOfTasks}) Want to install postman? (y/N): " postman
    if [[ $postman =~ ^[yY]$ ]]; then
        sudo snap install postman
        break
    elif [[ $postman =~ ^[nN]$ ]]; then
        echo "postman installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(9/${numberOfTasks}) Want to install vscode? (y/N): " vscode
    if [[ $vscode =~ ^[yY]$ ]]; then
        sudo snap install --classic code
        break
    elif [[ $vscode =~ ^[nN]$ ]]; then
        echo "vscode installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(10/${numberOfTasks}) Want to install nvm? (y/N): " nvm
    if [[ $nvm =~ ^[yY]$ ]]; then
        sudo apt install curl -y
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        break
    elif [[ $nvm =~ ^[nN]$ ]]; then
        echo "nvm installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(11/${numberOfTasks}) Want to install git? (y/N): " git
    if [[ $git =~ ^[yY]$ ]]; then
        sudo apt install git -y
        break
    elif [[ $git =~ ^[nN]$ ]]; then
        echo "git installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(12/${numberOfTasks}) Want to install docker? (y/N): " docker
    if [[ $docker =~ ^[yY]$ ]]; then
        sudo apt-get update -y
        sudo apt-get install ca-certificates curl -y
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
            $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update -y
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

        sudo groupadd docker
        sudo usermod -aG docker $USER
        # newgrp docker
        echo "Docker installation complete. Please reboot to apply group changes."
        break
    elif [[ $docker =~ ^[nN]$ ]]; then
        echo "docker installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

if ! command -v pip3 &> /dev/null; then
    while true; do
        read -p "(13/${numberOfTasks}) Want to install pip? (y/N): " pip
        if [[ $pip =~ ^[yY]$ ]]; then
            sudo apt install python3-pip -y
            break
        elif [[ $pip =~ ^[nN]$ ]]; then
            echo "pip3 installation skipped."
            break
        else
            echo "Please enter 'y' or 'n'."
        fi
    done
else
    echo "(13/${numberOfTasks}) Skipping the installation of pip as it has already been installed."
fi
echo -e "\n\n"

while true; do
    read -p "(14/${numberOfTasks}) Want to install ibus? (y/N): " ibus
    if [[ $ibus =~ ^[yY]$ ]]; then
        sudo apt-get install ibus-avro -y
        break
    elif [[ $ibus =~ ^[nN]$ ]]; then
        echo "ibus installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

echo "(15/${numberOfTasks}) Updating apt and apt-get again"
sudo apt update -y
sudo apt-get update -y
echo -e "\n\n"

echo "(16/${numberOfTasks}) Upgrading apt and apt-get again"
sudo apt upgrade -y
sudo apt-get upgrade -y
echo -e "\n\n"

echo "(17/${numberOfTasks}) Initiating .bash_aliases"
touch ~/.bash_aliases
echo "alias open='xdg-open'" >> ~/.bash_aliases
echo "alias google='google-chrome-stable'" >> ~/.bash_aliases
# source ~/.bashrc
echo -e "\n\n"

while true; do
    read -p "(18/${numberOfTasks}) Want to REBOOT? (y/N): " pip
    if [[ $pip =~ ^[yY]$ ]]; then
        reboot
        break
    elif [[ $pip =~ ^[nN]$ ]]; then
        echo "All packages installed. Please REBOOT to apply all changes"
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
