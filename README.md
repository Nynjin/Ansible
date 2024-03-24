# Ansible-project

<div align="center">
  <a href="https://github.com/Nynjin/Ansible/releases/latest"><img alt="Latest Release" src="https://img.shields.io/github/v/release/Nynjin/Ansible?label=Latest%20Release&logo=github"></a>
  <a href="https://github.com/Nynjin/Ansible/graphs/contributors"><img alt="Contributors" src="https://img.shields.io/github/contributors/Nynjin/Ansible"></a>
  <a href="https://github.com/Nynjin/Ansible/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/Nynjin/Ansible"></a>
</div>

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=ansible,openstack,php,wordpress,mysql,docker" />
  </a>
</p>

Ce projet Git permet de configurer des machines distances à l'aide d'Ansible afin de déployer une application php et WordPress avec mySQL et un reverse proxy Nginx.

L'architecture est automatisée avec l'implémentation de scripts permettant d'exécuter l'intégralité du processus à l'aide d'une seule commande.

Vous serez connecté au terminal de votre environnement docker où il vous sera possible de travailler avec les commandes Ansible.

## Getting started

1. Mettre votre clé ssh dans le dossier ".ssh".

2. Créer un fichier ".env" en suivant l'exemple ".env.example".

3. Accorder les permissions au script principal à l'aide de la commande "chmod u+x run.sh".

4. Lancer le script à l'aide de la commande

   ```bash
   ./run.sh [AUTO|MANUAL]
   ```

5. S'il s'agit du premier démarrage, il faudra autoriser l'ajout de vos connexions ssh.

6. Pour exécuter uniquement des tags spécifiques, lancez le script en mode "MANUAL" et exécuter la commande

   ```bash
   ansible-playbook main.yml -i inventories --tags [tags_à_exécuter] --skip-tags [tags_à_ignorer]
   ```

   tags possibles:

   - installation
   - configuration
   - deployment
   - cleanup

7. Avec la configuration actuelle, deux routes sont disponibles :

   - http://XXX.XXX.XXX.XXX/php pour le projet php standard avec une base de données mySQL
   - http://XXX.XXX.XXX.XXX/wordpress pour le projet wordpress

8. Pour quitter le terminal de votre environnement docker, utiliser la commande "exit".

9. Fermer le conteneur docker après l'avoir quitté.

## Authors

- Moncef Hassani (p2102522)
- Rudy Boullier (p2100788)
