# Utiliser une image de base légère, par exemple Alpine
FROM alpine:latest

# Installer curl et jq
RUN apk add --no-cache curl jq

# Variable d'argument pour le tag GitHub
ARG GITHUB_TAG

# Télécharger le fichier depuis GitHub en utilisant le tag
RUN curl -L -o /versions.tfvars.json "https://github.com/aneoconsulting/ArmoniK/raw/${GITHUB_TAG}/versions.tfvars.json"

# Commande par défaut (peut être remplacée par une autre commande au lancement du conteneur)
CMD ["cat", "/versions.tfvars.json"]
