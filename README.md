# Comment utiliser les scripts :

# Metasploitable 2 :
### Il suffit de lancer le script en tant que root.

# Metasploitable 3 :
### Il faut lancer le premier script (metasploitable3-1.sh) en tant que root.
### Puis le deuxième (metasploitable3-2.sh) en tant que test.

# Pour relancer les machines :
### Pour metasploitable2 :
    docker rm metasploitable && docker run -it --network host --name metasploitable     --hostname metasploitable2     tleemcjr/metasploitable2 bash

### Pour metasploitable3 :
### On crée une snapshot directement sur VirtualBox pour pouvoir la recloner si jamais il y a un défaut.
