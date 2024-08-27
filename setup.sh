#!/bin/bash

numberOfTasks=23

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
    read -p "(9/${numberOfTasks}) Want to install pycharm-community? (y/N): " pycharm
    if [[ $pycharm =~ ^[yY]$ ]]; then
        sudo snap install pycharm-community --classic
        break
    elif [[ $pycharm =~ ^[nN]$ ]]; then
        echo "pycharm-community installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(11/${numberOfTasks}) Want to install nvm? (y/N): " nvm
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
    read -p "(12/${numberOfTasks}) Want to install git? (y/N): " git
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
    read -p "(13/${numberOfTasks}) Want to install docker? (y/N): " docker
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
        break
    elif [[ $docker =~ ^[nN]$ ]]; then
        echo "docker installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(14/${numberOfTasks}) Want to install python3.12 and pip3 (python3.12)? (y/N): " python
    if [[ $python =~ ^[yY]$ ]]; then
        sudo apt install software-properties-common -y
        sudo add-apt-repository ppa:deadsnakes/ppa -y
        sudo apt update -y
        sudo apt install python3.12 -y
        echo "export PATH=$PATH:/usr/bin/python3.12" >> ~/.profile
        source ~/.profile

        pip_location=/home/$USER/.local/bin
        echo "export PATH=$PATH:$pip_location" >> ~/.profile
        source ~/.profile
        curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
        if [ ! -f ~/.bash_aliases ]; then
            touch ~/.bash_aliases
        fi
        echo "alias python3='python3.12'" >> ~/.bash_aliases
        break
    elif [[ $python =~ ^[nN]$ ]]; then
        echo "docker installation skipped."
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

if ! which pip > /dev/null; then
    while true; do
        read -p "(15/${numberOfTasks}) Want to install pip? (y/N): " pip
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
    echo "(15/${numberOfTasks}) Skipping the installation of pip as it has already been installed."
fi
echo -e "\n\n"

while true; do
    read -p "(16/${numberOfTasks}) Want to install ibus? (y/N): " ibus
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

while true; do
    read -p "(17/${numberOfTasks}) Want to install command line json parser? (y/N): " json
    if [[ $json =~ ^[yY]$ ]]; then
        sudo apt-get install jq -y
        if [ ! -f ~/.bash_aliases ]; then
            touch ~/.bash_aliases
        fi
        echo "alias json='jq'" >> ~/.bash_aliases
        break
    elif [[ $json =~ ^[nN]$ ]]; then
        echo "Installing command line json parser skipped"
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(18/${numberOfTasks}) Want to add aliases for build-in commands? (y/N): " bash_aliases
    if [[ $bash_aliases =~ ^[yY]$ ]]; then
        if [ ! -f ~/.bash_aliases ]; then
            touch ~/.bash_aliases
        fi
        echo "alias open='xdg-open'" >> ~/.bash_aliases
        echo "alias google='google-chrome-stable'" >> ~/.bash_aliases
        # source ~/.bashrc
        break
    elif [[ $bash_aliases =~ ^[nN]$ ]]; then
        echo "Adding aliases for build-in commands skipped"
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(19/${numberOfTasks}) Want to parse git branch in command prompt? (y/N): " parse_git_branch
    if [[ $parse_git_branch =~ ^[yY]$ ]]; then
        echo "(18/${numberOfTasks}) Want to parse git branch in command prompt?"
        git_branch_parser='
# Function to get the current Git branch
function parse_git_branch() {
    output=$(git branch 2>/dev/null | grep "^\*" | colrm 1 2)
    if [ -n "$output" ]; then
        echo " (${output})"
    fi
}
export PS1="\[\e[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\e[1;35m\]\$(parse_git_branch)\[\033[00m\]\$ "
'
        echo "$git_branch_parser" >> ~/.bashrc
        break
    elif [[ $parse_git_branch =~ ^[nN]$ ]]; then
        echo "Parsing git branch skipped"
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

while true; do
    read -p "(20/${numberOfTasks}) Want to install build-essential? (y/N): " build_essential
    if [[ $build_essential =~ ^[yY]$ ]]; then
        sudo apt-get install build-essential
        break
    elif [[ $build_essential =~ ^[nN]$ ]]; then
        echo "Installing build-essential skipped"
        break
    else
        echo "Please enter 'y' or 'n'."
    fi
done
echo -e "\n\n"

echo "(21/${numberOfTasks}) Updating apt and apt-get again"
sudo apt update -y
sudo apt-get update -y
echo -e "\n\n"

echo "(22/${numberOfTasks}) Upgrading apt and apt-get again"
sudo apt upgrade -y
sudo apt-get upgrade -y
echo -e "\n\n"

while true; do
    read -p "(23/${numberOfTasks}) Want to REBOOT? (y/N): " pip
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
