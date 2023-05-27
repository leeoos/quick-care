
BEGIN;

/* DATI GESTITI  DAGLI AMMINISTRATORI */

-- INSERIMENTO ENTI --
INSERT INTO ente(nome) 
VALUES ('Croce Rossa');

INSERT INTO ente(nome) 
VALUES ('Avis');

-- INSERIMENTO STRUTTURE --
INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Croce Rossa Italiana','Via Antonio Pacinotti','18', 'Roma' );

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Croce Rossa Italiana','Via Ezio','73', 'Latina' ); 

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Croce Rossa Italiana','Via S. Pietro','70', 'Viterbo' );

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Croce Rossa Italiana','Via Sestilio Carocci','8', 'Rieti' ); 


INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Avis Comunale Roma','Via Imperia','2', 'Roma' );

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Avis Comunale Latina','Corso G. Matteotti','238', 'Latina' ); 

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Avis Comunale Viterbo','Via Enrico Fermi','15', 'Viterbo' );

INSERT INTO struttura (nome, indirizzo.via, 
indirizzo.civico, indirizzo.citta) 
VALUES ('Avis Comunale Rieti','Via Cervellati','3', 'Rieti' );


-- INSERIMENTO OSPEDALI --
--1
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Viale del Policlinico','155','Roma', 'Policlinico Umberto I', '06 49971');

--2
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Via dei Monti Tiburtini', '385', 'Roma', 'Ospedale Sandro Pertini', '06 41431');

--3
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Via della Pineta Sacchetti', '217', 'Roma', 'Policlinico Agostino Gemelli', '06 30151');

--4
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Via di Grottarossa', '1035', 'Roma', 'Azienda Ospedaliera Sant’Andrea', '06 803451');

--5
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Piazza S. Onofrio', '332', 'Roma', 'Ospedale Pediatrico Bambino Gesu', '06 68591');

--6
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Via Portuense', '1035', 'Roma', 'Azienda Ospedaliera S. Camillo', '06 58703011');

--7
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Via Amba Aradam', '8', 'Roma', 'San Giovanni', '06 77051');

----------------------------------------------------------------------------------------------------
INSERT INTO ospedale (indirizzo.via, indirizzo.civico, 
indirizzo.citta, nome, telefono)
VALUES ('Riverside Drive', '12629', 'San DiFrangeles', 'Sacre Heart', '916-CALL-TURK'); 
----------------------------------------------------------------------------------------------------

-- INSERIMENTO SPECIALIZZAZIONI --
INSERT INTO specializzazione (nome) VALUES ('cardiologia');  -- 1
INSERT INTO specializzazione (nome) VALUES ('dermatologia'); -- 2
INSERT INTO specializzazione (nome) VALUES ('endocrinologia'); -- 3
INSERT INTO specializzazione (nome) VALUES ('fisiatria'); -- 4
INSERT INTO specializzazione (nome) VALUES ('gastroenterologia'); -- 5
INSERT INTO specializzazione (nome) VALUES ('ginecologia'); -- 6
INSERT INTO specializzazione (nome) VALUES ('neurologia'); -- 7
INSERT INTO specializzazione (nome) VALUES ('oculistica'); -- 8
INSERT INTO specializzazione (nome) VALUES ('oncologia'); -- 9 
INSERT INTO specializzazione (nome) VALUES ('ortopedia'); -- 10
INSERT INTO specializzazione (nome) VALUES ('otorinolaringoiatra'); -- 11
INSERT INTO specializzazione (nome) VALUES ('pneumologia'); -- 12
INSERT INTO specializzazione (nome) VALUES ('urologia'); -- 13
INSERT INTO specializzazione (nome) VALUES ('ecografia'); -- 14
INSERT INTO specializzazione (nome) VALUES ('elettromiografia'); -- 15
INSERT INTO specializzazione (nome) VALUES ('radiologia'); -- 16


-- INSERIMENTO MEDICO SPECIALISTA CON SPECIALIZZAZIONE --

-- Ospedale 1

--1
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Giannini', 'Stefano', 'Cardiologo');
INSERT INTO spec_prim(nome) 
VALUES ('cardiologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--2
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Bonomi', 'Alberto', 'Dermatologo');
INSERT INTO spec_prim(nome) 
VALUES ('dermatologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--3
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Tobia','Vacca', 'Endocrinologo');
INSERT INTO spec_prim(nome) 
VALUES ('endocrinologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--4
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Ubaldo','Lattuada', 'Fisiatra');
INSERT INTO spec_prim(nome) 
VALUES ('fisiatria');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--5
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Gervasio','Restelli', 'Gastroenterologo');
INSERT INTO spec_prim(nome) 
VALUES ('gastroenterologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--6
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Anselmo','Agrippa', 'Ginecologo');
INSERT INTO spec_prim(nome) 
VALUES ('ginecologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--7
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Minerva','Broggio', 'Neurologo');
INSERT INTO spec_prim(nome) 
VALUES ('neurologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--8
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Albano','Cosco', 'Oculista');
INSERT INTO spec_prim(nome) 
VALUES ('oculistica');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--9
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Asia','Zanco', 'Oncologo');
INSERT INTO spec_prim(nome) 
VALUES ('oncologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--10
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Luca','Sporchia', 'Ortopedico');
INSERT INTO spec_prim(nome) 
VALUES ('ortopedia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--11
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Emiliana','Conforto', 'Otorino');
INSERT INTO spec_prim(nome) 
VALUES ('otorinolaringoiatra');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--12
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Beniamina','Ricco', 'Pneumologo');
INSERT INTO spec_prim(nome) 
VALUES ('pneumologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--13
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Aida','Cavagnoli', 'Urologo');
INSERT INTO spec_prim(nome) 
VALUES ('urologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--14
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Miranda','Prandin', 'Ecografista');
INSERT INTO spec_prim(nome) 
VALUES ('ecografia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--15
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Gedeone','Fiordigigli', 'Cardiologo');
INSERT INTO spec_prim(nome) 
VALUES ('elettromiografia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');

--16
INSERT INTO medico_specialista (nome,cognome,nome_spec) 
VALUES ('Cinzia','Pulicelli', 'Radiologo');
INSERT INTO spec_prim(nome) 
VALUES ('radiologia');
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, 
indirizzo.citta)
VALUES ('Viale del Policlinico','155','Roma');
-----------------------------------------------------------------------------------------------------

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Rosario' , 'Aroffu' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Antonella' , 'Barreca' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Mia' , 'Mazotti' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Mia' , 'Cancemi' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Pantaleone' , 'Malagodi' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ludovico' , 'Stefanello' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Fulgenzio' , 'Castano' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Tommaso' , 'Alessandrini' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Martino' , 'Scotto' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Geltrude' , 'Massarente' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Arianna' , 'Mantovan' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Gianpaolo' , 'DAlba' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Amos' , 'Vitagliano' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Nina' , 'Burzi' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ismaele' , 'Capra' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Fabio' , 'Bugni' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via dei Monti Tiburtini', '385', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Teodoro' , 'Santagostino ' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Casimira' , 'Baretto ' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Edda' , 'Isella ' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ardito' , 'Gaddo ' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ladislao' , 'Davanzati ' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Medardo' , 'Spitalere ' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ezio' , 'Iacopini ' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Graziella' , 'Guglielmetti ' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Giuseppe' , 'Prandini ' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ersilia' , 'Pirri ' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Saul' , 'Ghesla ' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Melissa' , 'Zammataro ' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ivano' , 'Chicoli ' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Maria' , 'Dagostini ' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Michela' , 'Bombardiere ' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Melania' , 'La Volpe' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via della Pineta Sacchetti', '217', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Guido' , 'Agassini ' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Erminio' , 'Conterno ' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Bice' , 'Perla ' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Amleto' , 'Foletti ' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Betta' , 'Baldinu ' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Gustavo' , 'Dolcetto ' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Sveva' , 'Aggio ' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Eusebio' , 'Giordo ' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Evelina' , 'Donadello ' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Albano' , 'Loru ' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Giosuele' , 'Brugnola ' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Romeo' , 'Alfonzetti ' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Concetta' , 'Chinno ' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Nicolò' , 'Stracquadanio ' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Noè' , 'Raffaldo ' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Eligio' , 'Olivi' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via di Grottarossa', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Gianmario' , 'Domenico' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Nicoletta' , 'Nuschese' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Damiano' , 'Demasi' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ezio' , 'Tufo' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Manlio' , 'Mezzi' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Adriano' , 'Findanno' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Pippo' , 'Vaccarezza' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Monica' , 'Peretti' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Silvana' , 'Degrossi' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Marina' , 'Folletti' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Piero' , 'Canevisio' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Annamaria' , 'Falbo' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Bruno' , 'Zurru' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Leonardo' , 'Colavita' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Flavio' , 'Govoni' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Orietta' , 'Maccario' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Gregorio' , 'Bolmida' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Duilio' , 'Azara' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Aurelia' , 'Cavalcabò' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Francesca' , 'Peveri' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Efrem' , 'Marturana' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Sebastiano' , 'Espositi' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Dina' , 'Casiello' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Boris' , 'Allegranza' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Melchiorre' , 'Bottigli' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Egidio' , 'Oddone' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Elide' , 'Gorrara' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Maurilio' , 'Armellin' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Gualtiero' , 'Siro' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Silvestro' , 'Rotelli' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ginevra' , 'Scattoni' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Susanna' , 'Battelli' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Rachele' , 'De Vito' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'cardiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Valter' , 'Rolla' , 'Dermatologo' );
INSERT INTO spec_prim(nome) VALUES ( 'dermatologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Riccardo' , 'Baglio' , 'Endocrinologo' );
INSERT INTO spec_prim(nome) VALUES ( 'endocrinologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Oronzo' , 'Forastieri' , 'Fisiatra' );
INSERT INTO spec_prim(nome) VALUES ( 'fisiatria' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Debora' , 'Piloti' , 'Gastroenterologo' );
INSERT INTO spec_prim(nome) VALUES ( 'gastroenterologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Tiziana' , 'Nerli' , 'Ginecologo' );
INSERT INTO spec_prim(nome) VALUES ( 'ginecologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Rosario' , 'Monachini' , 'Neurologo' );
INSERT INTO spec_prim(nome) VALUES ( 'neurologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ludovico' , 'Berti' , 'Oculista' );
INSERT INTO spec_prim(nome) VALUES ( 'oculistica' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Adamo' , 'Bergami' , 'Oncologo' );
INSERT INTO spec_prim(nome) VALUES ( 'oncologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Onorio' , 'Striano' , 'Ortopedico' );
INSERT INTO spec_prim(nome) VALUES ( 'ortopedia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Ezechiele' , 'Sammarco' , 'Otorino' );
INSERT INTO spec_prim(nome) VALUES ( 'otorinolaringoiatra' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Landolfo' , 'Cerasa' , 'Pneumologo' );
INSERT INTO spec_prim(nome) VALUES ( 'pneumologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Valentino' , 'Griffini' , 'Urologo' );
INSERT INTO spec_prim(nome) VALUES ( 'urologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Semplicio' , 'Micossi' , 'Ecografista' );
INSERT INTO spec_prim(nome) VALUES ( 'ecografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Emanuele' , 'Di Napoli' , 'Cardiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'elettromiografia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');

INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES ( 'Iginio' , 'Muselli' , 'Radiologo' );
INSERT INTO spec_prim(nome) VALUES ( 'radiologia' );
INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');



-- INSERIMENTO SPECIALIZZAZIONE SECONDARIA --
INSERT INTO spec(id_specialista,nome) 
VALUES ('3', 'oncologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('5', 'oncologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('11', 'oncologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('13', 'oncologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('3', 'radiologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('5', 'radiologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('11', 'radiologia');

INSERT INTO spec(id_specialista,nome) 
VALUES ('13', 'radiologia');


-- INSERIMENTO MEDICI DI BASE --
INSERT INTO medico_base (nome, cognome)
VALUES ('dr.', 'acula');


/* DATI UTENTI */

-- INSERIMENTO PRESCRIZIONI --
INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('A1', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A1', 'FRGLLL25L65B960D');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('A2','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A2', 'FRGLLL25L65B960D');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('A3', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A3', 'FRGLLL25L65B960D');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('A4', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A4', 'FRGLLL25L65B960D');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('A5','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A5', 'FRGLLL25L65B960D');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('A6', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('A6', 'FRGLLL25L65B960D');

--------------------------------------------------------------------------------

INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('B1', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B1', 'RSNGST16B17H861J');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('B2','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B2', 'RSNGST16B17H861J');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('B3', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B3', 'RSNGST16B17H861J');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('B4', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B4', 'RSNGST16B17H861J');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('B5','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B5', 'RSNGST16B17H861J');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('B6', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('B6', 'RSNGST16B17H861J');

-------------------------------------------------------------------------------

INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('C1', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C1', 'DNSPCD43C29E910S');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('C2','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C2', 'DNSPCD43C29E910S');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('C3', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C3', 'DNSPCD43C29E910S');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo, descrizione)
VALUES ('C4', '1', '01/01/2020','oncologia','Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C4', 'DNSPCD43C29E910S');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('C5','1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C5', 'DNSPCD43C29E910S');

INSERT INTO prescrizione (codice, id_base, data_presc, tipo,  descrizione)
VALUES ('C6', '1', '01/01/2020','ortopedia', 'Visita');
INSERT INTO prescrizione_paziente (codice, paziente_cf)
VALUES ('C6', 'DNSPCD43C29E910S');


COMMIT;

