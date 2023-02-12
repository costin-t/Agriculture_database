CREATE TABLE clienti (
 id_client INT NOT NULL PRIMARY KEY,
 nume_client varchar2 (100) NOT NULL,
 cnp_cui_client varchar(15) UNIQUE,
 adresa_client varchar(255),
 telefon_client INT UNIQUE,
 datorii_client int 
 );

CREATE TABLE judet (
  id_judet INT NOT NULL PRIMARY KEY,
  nume_judet varchar2(50) NOT NULL UNIQUE,
  id_client int,
FOREIGN KEY (id_client) REFERENCES clienti(id_client)
);

CREATE TABLE tara (
id_tara INT NOT NULL PRIMARY KEY,
nume_tara varchar(50) NOT NULL,
id_judet INT,
FOREIGN KEY (id_judet) REFERENCES judet(id_judet) 
);

CREATE TABLE angajatii (
id_angajat INT NOT NULL PRIMARY KEY,
salariul int NOT NULL, 
nume_angajat varchar2 (55),
prenume_angajat varchar2(55),
telefon_angajat int UNIQUE,
comision_vanzari int,
id_client int,
FOREIGN KEY (id_client) REFERENCES clienti(id_client),
id_judet int,
FOREIGN KEY (id_judet) REFERENCES judet(id_judet)
);

CREATE TABLE comenzi ( 
id_comanda int NOT NULL PRIMARY KEY,
data_comanda date, 
modplata_comanda varchar2(9) NOT NULL,
stare_comanda varchar2(55),
id_angajat int,
FOREIGN KEY (id_angajat) REFERENCES angajatii (id_angajat)  
);

CREATE TABLE servicii (
id_servicii INT NOT NULL PRIMARY KEY,
nume_servicii varchar2 (50) NOT NULL ,
descriere_servicii varchar (255) NOT NULL ,
pret_servici int NOT NULL,
id_angajat int  ,
FOREIGN KEY (id_angajat) REFERENCES angajatii (id_angajat)
);

CREATE TABLE produse (
id_produs INT NOT NULL PRIMARY KEY,
descriere_produs varchar2 (255),
pret_produs INT NOT NULL,
cantitate INT NOT NULL ,
id_comanda INT,
FOREIGN KEY (id_comanda) REFERENCES comenzi (id_comanda)
);

CREATE TABLE inventar (
id_iventar int NOT NULL PRIMARY KEY,
cantitate_stoc int,
data_expirarii date NOT NULL ,
id_produs int,
FOREIGN KEY (id_produs) REFERENCES produse (id_produs)
);

CREATE TABLE furnizori (
id_furnizor int NOT NULL PRIMARY KEY,
nume_furnizor varchar2 (255),
datorie_catre_furnizor int,
id_comanda int,
FOREIGN KEY (id_comanda) REFERENCES comenzi (id_comanda)  
);

CREATE TABLE factura (
id_factura int NOT NULL PRIMARY KEY,
data_factura date NOT NULL ,
id_comanda int,
FOREIGN KEY (id_comanda) REFERENCES comenzi (id_comanda),
id_furnizor int,
FOREIGN KEY (id_furnizor) REFERENCES furnizori (id_furnizor)
);

CREATE TABLE concentrati_substante (
id_subs int PRIMARY KEY,
subst_nume varchar2 (50), 
subst_magneziu INT,
subst_fosofor INT,
subst_potasiu INT
);

/*DROP TABLE concentrati_substante;
DROP TABLE factura;
DROP TABLE furnizori;
DROP TABLE inventar;
DROP TABLE produse;
DROP TABLE servicii;
DROP TABLE comenzi;
DROP TABLE angajatii;
DROP TABLE tara;
DROP TABLE judet;
DROP TABLE clienti; */

