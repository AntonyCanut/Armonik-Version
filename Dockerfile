# Utiliser une image de base légère, par exemple Alpine
FROM alpine:latest

# Installer git
RUN apk add --no-cache git jq

# Variable d'argument pour le tag GitHub
ARG GITHUB_TAG

# Définir le répertoire de travail
WORKDIR /app

# Cloner le dépôt spécifique et extraire le fichier souhaité
RUN git clone --depth 1 --branch ${GITHUB_TAG} https://github.com/aneoconsulting/ArmoniK.git && \
    mv ArmoniK/versions.tfvars.json ./ && \
    rm -rf ArmoniK

# Commande par défaut (peut être remplacée par une autre commande au lancement du conteneur)
CMD ["cat", "versions.tfvars.json"]
