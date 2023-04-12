-- Active: 1673204451593@@127.0.0.1@3306
CREATE DATABASE GSC
    DEFAULT CHARACTER SET = 'utf8mb4';
   
   USE GSC;
    CREATE TABLE personnes (id_user INT NOT NULL AUTO_INCREMENT , nom VARCHAR(255) NOT NULL , prenom VARCHAR(255) NOT NULL , email VARCHAR(255) NOT NULL , tel VARCHAR(255)  NOT NULL, nom_mark VARCHAR(255) NOT NULL , logo VARCHAR(255) NOT NULL , longitude VARCHAR(255) NOT NULL , latitude VARCHAR(255) NOT NULL , id_type_article INT NOT NULL , PRIMARY KEY (id_user) );
    USE GSC;
    CREATE TABLE roles(id_role INT NOT NULL AUTO_INCREMENT , role_name VARCHAR(255) NOT NULL , PRIMARY KEY (id_role));
    CREATE TABLE categories(id_cat INT NOT NULL AUTO_INCREMENT , nom_cat VARCHAR(255) NOT NULL  , id_sous_cat INT DEFAULT (NULL) NOT NULL , PRIMARY KEY (id_cat));
    CREATE TABLE discussions(id_msg INT NOT NULL AUTO_INCREMENT , id_sender INT NOT NULL , id_receiver INT NOT NULL ,msg_content TEXT  , send_date VARCHAR(255)  DEFAULT(CURRENT_TIMESTAMP) NOT NULL , is_seen BOOLEAN NOT NULL DEFAULT(NULL) , PRIMARY KEY(id_msg)); 
    CREATE TABLE paiement (id_paie INT NOT NULL AUTO_INCREMENT , montant FLOAT NOT NULL  ,  type VARCHAR(255) NOT NULL, date DATE NOT NULL , id_user_paie INT NOT NULL  , PRIMARY KEY (id_paie) );
    ALTER TABLE paiement ADD (id_user_paie INT NOT NULL);
    CREATE TABLE commandes (id_com INT NOT NULL AUTO_INCREMENT , date  DATETIME NOT NULL , status VARCHAR(255) NOT NULL, livraion_adresse VARCHAR(255) NOT NULL , id_user_com INT NOT NULL , PRIMARY KEY (id_com));
    CREATE TABLE article_com (id_contained INT NOT NULl  AUTO_INCREMENT , id_article INT NOT NULL , id_com INT NOT NULL , quantite FLOAT NOT NULL ,  PRIMARY KEY (id_contained));
    CREATE TABLE articles (id_article INT NOT NULL AUTO_INCREMENT , nom VARCHAR(255) NOT NULL , video VARCHAR(255) NOT NULL , picture VARCHAR(255) NOT NULl , description TEXT NOT NULL , PRIMARY KEY (id_article));
    CREATE TABLE vendre (id_v INT NOT NULL AUTO_INCREMENT , id_vendeur  INT NOT NULL , id_article INT NOT NULL,  prix FLOAT NOT NULL , stock FLOAT NOT NULL , PRIMARY KEY (id_v));
ALTER TABLE commandes ADD  (id_user_commander INT NOT NULL);
ALTER TABLE commandes ADD FOREIGN KEY(id_user_commander) REFERENCES personnes (id_user);
ALTER TABLE paiement ADD FOREIGN KEY(id_user_paie) REFERENCES personnes (id_user);
ALTER TABLE articles ADD (id_cat INT NOT NULL);
ALTER TABLE articles ADD FOREIGN KEY(id_cat) REFERENCES categories(id_cat);
CREATE TABLE type_article (id_type INT NOT NULL AUTO_INCREMENT , libellé VARCHAR(255) NOT NULL , description VARCHAR(255) NOT NULL ,  PRIMARY KEY (id_type));
ALTER TABLE personnes ADD FOREIGN KEY (id_type_article) REFERENCES type_article (id_type);
ALTER TABLE personnes ADD (id_role INT NOT NULL );
ALTER TABLE personnes  ADD FOREIGN KEY (id_role) REFERENCES roles(id_role);