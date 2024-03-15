drop table if exists modules cascade;
drop table if exists SAE cascade;
drop table if exists note cascade;
drop table if exists enseignant cascade;
drop table if exists controle cascade;
drop table if exists ressource cascade;
drop table if exists semestre cascade;
drop table if exists etudiant cascade;
drop table if exists groupes cascade;

CREATE TABLE groupes (
    id_groupe INT PRIMARY KEY,
    nom_groupe VARCHAR(255),
    nb_eleves INT
);

CREATE TABLE etudiant (
    id_etudiant INT PRIMARY KEY,
    nom_etudiant VARCHAR(255) NOT NULL,
    prenom_etudiant VARCHAR(255) NOT NULL,
    groupe INTEGER NOT NULL,
    FOREIGN KEY (groupe) REFERENCES groupes(id_groupe)
);

CREATE TABLE semestre (
    id_semestre INT PRIMARY KEY,
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE ressource (
    id_ressource VARCHAR(5) PRIMARY KEY,
    nom_ressource VARCHAR(255),
    coef INT,
    semestre INT,
    FOREIGN KEY (semestre) REFERENCES semestre(id_semestre)
);

CREATE TABLE controle (
  id_controle INT PRIMARY KEY,
  nom_controle VARCHAR(255),
  ressource_concernee VARCHAR(5),
  FOREIGN KEY (ressource_concernee) REFERENCES ressource(id_ressource)
);

CREATE TABLE enseignant (
    id_enseignant INT PRIMARY KEY,
    nom_enseignant VARCHAR(255),
    prenom_enseignant VARCHAR(255),
    ressource_enseignee VARCHAR(5)
);

CREATE TABLE note (
    id_note INT PRIMARY KEY,
    id_etudiant INT REFERENCES etudiant(id_etudiant),
    id_controle INT REFERENCES controle(id_controle),
    coefficient INT,
    note FLOAT
);

CREATE TABLE SAE (
    id_sae INT PRIMARY KEY,
    code_sae  VARCHAR(5) UNIQUE,
    nom_sae VARCHAR(255),
    id_controle INT,
    note_sae FLOAT,
    FOREIGN KEY (id_controle) REFERENCES controle(id_controle)
);

CREATE TABLE modules (
    id_module VARCHAR(4) PRIMARY KEY,
    nom_module VARCHAR(255),
    moyenne INT,
    code_sae VARCHAR(5),
    sae VARCHAR(255),
    FOREIGN KEY (code_sae) REFERENCES SAE(code_sae)
);
