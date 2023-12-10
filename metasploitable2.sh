#!/bin/bash

## Fonctions :

install-docker() {
    clear
    echo "[*] Mise à jour de la liste des paquets..."
    apt-get -qq update 
    
    echo "[*] Installation des paquets nécessaires..."
    apt-get -qq install -y ca-certificates curl gnupg sudo lsb-release gnupg2 apt-transport-https software-properties-common

    echo "[*] Récupération des clés gpg..."
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian.gpg
    echo "[*] Ajout de la liste de paquets Docker..."
    sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    echo "[*] Mise à jour de la liste des paquets..."
    apt-get -qq update -y 
    
    echo "[*] Installation des paquets Docker..."
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    echo "[*] Lancement d'un docker de test pour vérifier l'environnement..."
    systemctl start docker

    echo "[*] Ajout de l'utilisateur actuel au groupe Docker..."
    usermod -aG docker test
    echo "[*] Fait en sorte que Docker se lance au démarrage de la machine..."
    systemctl enable docker
}

install-metasploitable2() {
    clear
    echo "[*] Lancement de metasploitable 2..."
    echo "[*] Une fois dans le shell, il faut taper services.sh et c'est fini !"
    docker run -it --network host --name metasploitable     --hostname metasploitable2     tleemcjr/metasploitable2 bash

}

install-docker
install-metasploitable2