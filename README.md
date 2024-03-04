# Ansible-project

Ce projet Git permet de configurer des machines distances à l'aide d'Ansible afin de déployer une application php.
L'architecture est entièrement dockerisé avec l'implémentation de scripts permettant d'automatiser l'intégralité du processus.
Vous serez connecté au terminal de votre environnement docker où il vous sera possible de travailler avec les commandes ansible.
Pensez à fermer votre conteneur docker lorsque vous avez terminé.

Le travail a été realisé par Moncef Hassani (p2102522) et Rudy Boullier (p2100788)

## Getting started

1. Mettre votre clé ssh dans le dossier ".ssh".

2. Créer un fichier ".env" en suivant l'exemple ".env.example".

3. Accorder les permissions au script principal à l'aide de la commande "chmod u+x run.sh".

4. Lancer le script à l'aide de la commande "./run.sh".

5. S'il s'agit du premier démarrage, il faudra autoriser l'ajout de vos connexions ssh.

6. Pour quitter le terminal de votre environnement docker, utiliser la commande "exit".
