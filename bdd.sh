#!/bin/bash
# Variables de configuration
DB_HOST="127.0.0.1"
DB_USER="root"
DB_PASSWORD="foo"
DB_NAME="SAE41"

# Création de la base de données
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "CREATE DATABASE $DB_NAME;"

# Utilisation de la base de données
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "USE $DB_NAME;"

# Création des tables
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME <<EOF
CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50)
);

CREATE TABLE rdv (
    id_rdv INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_user INT NOT NULL,
    jour VARCHAR(10) NOT NULL,
    mois VARCHAR(20) NOT NULL,
    annee VARCHAR(10) NOT NULL,
    heure VARCHAR(10) NOT NULL
);
EOF

echo "La base de données et les tables ont été créées avec succès."
