# FROM robertolandry/docker-in-docker:latest
# RUN  apt update 


# Créez un fichier Dockerfile pour construire une image Docker basée sur
# Ubuntu.


FROM robertolandry/ubuntu
RUN  apt update && apt install openssh-server -y    


# installation du serveru ssh

RUN apt install openssh-server -y

# creation de l'utilisateur 

RUN useradd -m roberto

# installation de sudo 

RUN apt install sudo 

# suppression du mot de passe de l'utilisateur 

RUN sudo passwd -d roberto

# creation d'un groupe pour l'utilisateur 

RUN sudo groupadd roberto_group

# ajout de l'utlisateur au groupe creee et au groupe sudo 

RUN sudo usermod -aG sudo roberto

RUN sudo  usermod -aG roberto_group roberto

# specification du shell de l'utilisateur 

RUN usermod -s /bin/bash roberto

# creation du dossier .ssh pour le stockages de la cle publique 

RUN mkdir /home/roberto/.ssh

# creation du fichier de cle publique 

RUN touch /home/roberto/.ssh/authorized_keys

# copie de ma cle publique locale dans le fichier authorized_keys du dossier .ssh de mon conteneur 

COPY idkey.pub /home/roberto/.ssh/authorized_keys

# changement des droits et premissions du fichier authorized_keys quil soit manupulable par l'utilisateur roberto 

RUN sudo chown roberto:roberto_group /home/roberto/.ssh/authorized_keys

# NB partie optionnelle : vous pouvez decomenter la ligne suivante  pour vous assurer que votre cle a bien ete copie 

RUN cat /home/roberto/.ssh/authorized_keys




RUN sudo  apt install docker.io -y









# Ajoutez les instructions pour installer les outils réseau nécessaires :
# iputils-ping, dnsutils, net-tools, iftop, tcpdump, ufw,
# openssh-client, iperf3, nmap, netcat, curl, vim, sudo.

RUN apt-get update && apt-get install -y \
    iputils-ping \
    dnsutils \
    net-tools \
    iftop \
    tcpdump \
    ufw \
    openssh-client \
    iperf3 \
    nmap \
    netcat \
    curl \
    vim \
    sudo \
    && rm -rf /var/lib/apt/lists/*




# Créez un utilisateur non-root techuser avec les privilèges sudo.
RUN sudo groupadd techuser_group
RUN useradd -m techuser 
RUN usermod -s /bin/bash techuser 
RUN usermod -aG sudo techuser
RUN usermod -aG techuser_group roberto
RUN passwd -d techuser



RUN su - ${USER}

RUN groups

RUN sudo  usermod -aG docker roberto





# 
# #
# # #



# RUN sudo systemctl start ufw


# Configurez UFW pour autoriser les connexions SSH.
RUN sudo ufw allow ssh 

RUN sudo ufw allow 22/tcp

# partie test
RUN sudo ufw deny from 192.168.100.9

RUN sudo ufw deny from 172.17.0.1




# configurez le conteneur pour utiliser techuser par défaut.
USER techuser


# # #
# #
#








# creation du dossier .ssh pour le stockages de la cle publique 

RUN mkdir /home/techuser/.ssh

# creation du fichier de cle publique 

RUN touch /home/techuser/.ssh/authorized_keys

# copie de ma cle publique locale dans le fichier authorized_keys du dossier .ssh de mon conteneur 

COPY idkey.pub /home/techuser/.ssh/authorized_keys

# changement des droits et premissions du fichier authorized_keys quil soit manupulable par l'utilisateur techuser 

RUN sudo chown techuser:techuser_group /home/techuser/.ssh/authorized_keys

# NB partie optionnelle : vous pouvez decomenter la ligne suivante  pour vous assurer que votre cle a bien ete copie 

RUN cat /home/techuser/.ssh/authorized_keys

RUN sudo systemctl start docker
RUN sudo systemctl enable docker
RUN sudo systemctl restart docker 





# Définissez le port 22 pour SSH 
EXPOSE 22

# lancement du service ssh 

RUN sudo service ssh start

# configuration pour un lancement automatique de ce service apres chaques demarage de conteneur 

CMD ["sudo","/usr/sbin/sshd", "-D"]