#!/bin/bash

# Définir le message HTML à servir
HTML_CONTENT="<html>
  <body>
    <h1>Bienvenue sur mon serveur web simple !</h1>
    <p>Ce message est servi par netcat sur le port 8080.</p>
  </body>
</html>"

# Démarrer le serveur web avec netcat
nc -l 8080 <<< "$HTML_CONTENT"