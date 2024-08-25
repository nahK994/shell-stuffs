#!/bin/bash

echo -e "Updating apt and apt-get\n\n"
sudo apt update -y
sudo apt-get update -y

echo -e "Upgrading apt and apt-get\n\n"
sudo apt upgrade -y
sudo apt-get upgrade -y

while true; do
    read -p "Want to install go? (y/N): " go
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
    read -p "Want to install google chrome? (y/N): " chrome
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
    read -p "Want to install VLC? (y/N): " vlc
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
    read -p "Want to install htop? (y/N): " htop
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
    read -p "Want to install tree? (y/N): " tree
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
    read -p "Want to install postman? (y/N): " postman
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
    read -p "Want to install nvm? (y/N): " nvm
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
    read -p "Want to install git? (y/N): " git
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
    read -p "Want to install docker? (y/N): " docker
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
        newgrp docker
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
        read -p "Want to install pip? (y/N): " pip
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
fi
echo -e "\n\n"

while true; do
    read -p "Want to install ibus? (y/N): " ibus
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

echo -e "Upgrading apt and apt-get again\n\n"
sudo apt upgrade -y
sudo apt-get upgrade -y
