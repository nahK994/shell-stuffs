#!/bin/bash

numberOfTasks=21

# Function to prompt user for yes/no input and execute commands
ask_install() {
    local task_number=$1
    local task_name=$2
    local install_command=$3
    local skip_message=$4

    while true; do
        read -p "($task_number/$numberOfTasks) Want to install $task_name? (y/N): " response
        if [[ $response =~ ^[yY]$ ]]; then
            eval $install_command
            break
        elif [[ $response =~ ^[nN]$ ]]; then
            echo "$skip_message installation skipped."
            break
        else
            echo "Please enter 'y' or 'n'."
        fi
    done
    echo -e "\n\n"
}

# Function to install packages using apt
install_apt_package() {
    local package_name=$1
    sudo apt install -y $package_name
}

# Function to install packages using snap
install_snap_package() {
    local package_name=$1
    sudo snap install $package_name
}

# Function to install a package using wget
install_wget_package() {
    local url=$1
    local output_file=$2
    local extract_dir=$3
    wget -O $output_file $url
    sudo rm -rf $extract_dir && sudo tar -C /usr/local -xzf $output_file
}

# (1) Updating apt and apt-get
echo "(1/$numberOfTasks) Updating apt and apt-get"
sudo apt update -y
sudo apt-get update -y
echo -e "\n\n"

# (2) Upgrading apt and apt-get
echo "(2/$numberOfTasks) Upgrading apt and apt-get"
sudo apt upgrade -y
sudo apt-get upgrade -y
echo -e "\n\n"

# (3) Install Go
ask_install 3 "Go" "install_wget_package https://golang.org/dl/go1.23.0.linux-amd64.tar.gz go1.23.0.linux-amd64.tar.gz /usr/local/go" "Go"

# (4) Install Google Chrome
ask_install 4 "Google Chrome" "wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb" "Google Chrome"

# (5) Installing Snap
if ! which snap > /dev/null; then
    echo "(5/$numberOfTasks) installing snap"
    sudo apt install snapd -y
else
    echo "(5/$numberOfTasks) Skipping the installation of snap as it has already been installed."
fi
echo -e "\n\n"

# (6-21) Install commonly used packages via Snap or apt
ask_install 6 "VLC" "install_snap_package vlc" "VLC"
ask_install 7 "htop" "install_snap_package htop" "htop"
ask_install 8 "tree" "install_snap_package tree" "tree"
ask_install 9 "Postman" "install_snap_package postman" "Postman"
ask_install 10 "VS Code" "install_snap_package --classic code" "VS Code"
ask_install 11 "PyCharm Community" "install_snap_package pycharm-community --classic" "PyCharm Community"
ask_install 12 "Redis" "install_apt_package redis-tools && sudo snap install redis" "Redis"
ask_install 13 "NVM" "sudo apt install curl -y && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash" "NVM"
ask_install 14 "Git" "install_apt_package git && git config --global user.name nahK994 && git config --global user.email nkskl6@gmail.com" "Git"
ask_install 15 "Docker" "install_apt_package ca-certificates curl -y && sudo install -m 0755 -d /etc/apt/keyrings && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && sudo chmod a+r /etc/apt/keyrings/docker.asc && echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo \"\$VERSION_CODENAME\") stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y && sudo groupadd docker && sudo usermod -aG docker $USER" "Docker"
ask_install 16 "Python3.12" "install_apt_package software-properties-common && sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt update -y && sudo apt install python3.12 -y && echo \"export PATH=\$PATH:/usr/bin/python3.12\" >> ~/.profile && source ~/.profile && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 && echo \"alias python3='python3.12'\" >> ~/.bash_aliases" "Python3.12"

# (17) Install pip if not installed
if ! which pip > /dev/null; then
    ask_install 17 "pip3" "install_apt_package python3-pip" "pip"
else
    echo "(17/$numberOfTasks) Skipping the installation of pip as it has already been installed."
fi
echo -e "\n\n"

# (18) Install Virtualenv
ask_install 18 "virtualenv" "pip3 install virtualenv" "Virtualenv"

# (19) Install IBus
ask_install 19 "IBus" "install_apt_package ibus-avro" "IBus"

# (20) Install jq (JSON CLI parser)
ask_install 20 "command line JSON parser" "install_apt_package jq && echo \"alias json='jq'\" >> ~/.bash_aliases" "JSON Parser"

# (21) Add aliases for common commands
ask_install 21 "build-in commands aliases" "echo \"alias open='xdg-open'\" >> ~/.bash_aliases && echo \"alias google='google-chrome-stable'\" >> ~/.bash_aliases" "Aliases"

echo "Setup complete!"
