FROM robertolandry/docker-in-docker:latest
RUN  apt update 


# Install essential packages
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

RUN sudo groupadd techuser_group
RUN useradd -m techuser 
RUN usermod -s /bin/bash techuser 
RUN usermod -aG sudo techuser
RUN usermod -aG techuser_group roberto
RUN passwd -d techuser


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

# exposition du port d'access en ssh 

EXPOSE 22