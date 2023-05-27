
/* CREAZIONE DELLO SCHEMA */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* CREAZIONE DEI DOMINI */

-- INDIRIZZO (addr) --
CREATE TYPE addr AS (
via VARCHAR(100) , civico VARCHAR(1000) ,
citta VARCHAR(100)
);

-- GRUPPO SANGUIGNO --
CREATE TYPE gruppo_sanguigno AS ENUM (
'0+', '0-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'
);

-- SANGUE DONATO (don_real) --
CREATE DOMAIN don_real AS REAL 
CHECK ( value >= 200 and value <= 450);

/* CREAZIONE DELLE TABELLE */

-- PAZIENTE --
CREATE TABLE paziente (
	cf VARCHAR(16) ,
	nome VARCHAR(50) NOT NULL,
	cognome VARCHAR(50) NOT NULL,
	pwd VARCHAR(50) NOT NULL,
	num_tel VARCHAR(50),
	gruppo gruppo_sanguigno, 

	PRIMARY KEY (cf)

);

-- VALORE EMAIL --
CREATE TABLE valore_email (
	valore VARCHAR(150) ,

	PRIMARY KEY (valore)

);

-- PAZIENTE <--> VALORE EMAIL --
CREATE TABLE email (
	cf_paziente VARCHAR(16),
	valore VARCHAR(150),

	PRIMARY KEY (cf_paziente, valore),

	FOREIGN KEY(cf_paziente)
	REFERENCES paziente(cf),

	FOREIGN KEY (valore)
	REFERENCES valore_email(valore)
);

-- STRUTTURA ---
CREATE TABLE struttura (
	nome VARCHAR(50) NOT NULL ,
	indirizzo addr,

	PRIMARY KEY (indirizzo)
);

-- PERSONALE --
CREATE TABLE personale (
	id BIGSERIAL,

	PRIMARY KEY (id)
);

-- PERSONALE <--> STRUTTURA --
CREATE TABLE pren_strut (
	indirizzo_struttura addr ,
	id_personale INT ,

	PRIMARY KEY(indirizzo_struttura, id_personale),

	FOREIGN KEY(id_personale)
	REFERENCES personale(id),

	FOREIGN KEY (indirizzo_struttura)
	REFERENCES struttura(indirizzo)
);

-- ENTE --
CREATE TABLE ente (
	nome VARCHAR(50),

	PRIMARY KEY (nome)
);

-- MEDICO BASE --
CREATE TABLE medico_base (
	id BIGSERIAL,
	nome VARCHAR(50) NOT NULL,
	cognome VARCHAR(50) NOT NULL,

	PRIMARY KEY (id)
);

-- OSPEDALE --
CREATE TABLE ospedale (
	nome VARCHAR(50) NOT NULL,
	indirizzo addr ,
	telefono VARCHAR(50) NOT NULL,

	PRIMARY KEY (indirizzo)
);

-- MEDICO SPECIALISTA --
CREATE TABLE medico_specialista (
	id BIGSERIAL,
	nome VARCHAR(50) NOT NULL,
	cognome VARCHAR(50) NOT NULL,
	nome_spec VARCHAR(50) NOT NULL, 

	PRIMARY KEY (id)
);

-- MEDICO <--> OSPEDALE --
CREATE TABLE medico_osp (
	indirizzo addr,
	id_specialista BIGSERIAL,

	PRIMARY KEY (indirizzo, id_specialista),

	FOREIGN KEY (indirizzo)
	REFERENCES ospedale(indirizzo),

	FOREIGN KEY (id_specialista) 
	REFERENCES medico_specialista(id)
);

-- SPECIALIZZAZIONE --
CREATE TABLE specializzazione (
	nome VARCHAR(50) ,

	PRIMARY KEY(nome)
);

-- SPECIALIZZAZIONE <-->  MEDICO SPECIALISTA --
CREATE TABLE spec (
	id_specialista INT,
	nome VARCHAR(50),

	PRIMARY KEY (id_specialista,nome),

	FOREIGN KEY (id_specialista) 
	REFERENCES medico_specialista(id),

	FOREIGN KEY (nome) 
	REFERENCES specializzazione(nome)

);

-- SPECIALIZZAZIONE <-->  MEDICO SPECIALISTA -- PRIMRIA --
CREATE TABLE spec_prim (
	id_specialista BIGSERIAL, -- ATTENZIONE: mossa pericolosa
	nome VARCHAR(50) NOT NULL,

	PRIMARY KEY (id_specialista),

	FOREIGN KEY (id_specialista) 
	REFERENCES medico_specialista(id),

	FOREIGN KEY (nome) 
	REFERENCES specializzazione(nome)

);

-- DONAZIONE --
CREATE TABLE donazione (
	data_donazione DATE ,
	donatore_cf VARCHAR(16) ,
	nome_ente VARCHAR(50) NOT NULL ,
	indirizzo_struttura addr NOT NULL ,
	quantita don_real NOT NULL,

	PRIMARY KEY (data_donazione, donatore_cf),

	FOREIGN KEY (donatore_cf)
	REFERENCES paziente(cf),

	FOREIGN KEY (nome_ente)
	REFERENCES ente(nome),

	FOREIGN KEY (indirizzo_struttura)
	REFERENCES struttura(indirizzo)

);

-- PRENOTAZIONE --
CREATE TABLE prenotazione (
	codice VARCHAR(50) ,
	paziente_cf VARCHAR(16) NOT NULL,
	indirizzo_ospedale addr NOT NULL,
	id_specialista INT NOT NULL,
	data_pren DATE NOT NULL ,
	ora_pren REAL NOT NULL , 
	-- Tipo di specializzazione associata alla prenotazione 	
	tipo VARCHAR(50),
	-- Descrizione della prestazione associata alla prenotazione			
	descrizione VARCHAR(250),	

	PRIMARY KEY (codice),

	FOREIGN KEY (paziente_cf)
	REFERENCES paziente(cf),

	FOREIGN KEY (indirizzo_ospedale)
	REFERENCES ospedale(indirizzo),

	FOREIGN KEY (id_specialista) 
	REFERENCES medico_specialista(id)

);

-- PRESCRIZIONE --
CREATE TABLE prescrizione (
	codice VARCHAR(50),
	id_base INT NOT NULL,
	data_presc DATE NOT NULL ,
	-- Tipo di specializzazione associata alla prescrizione
	tipo VARCHAR(50),	
	-- Descrizione della prestazione associata alla prescrizione	  
	descrizione VARCHAR(250), 

	PRIMARY KEY (codice),

	FOREIGN KEY (id_base)
	REFERENCES medico_base(id)

);

CREATE TABLE prescrizione_paziente (
	codice VARCHAR(50),
	paziente_cf VARCHAR(16) NOT NULL,

	PRIMARY KEY (codice)

	--FOREIGN KEY (paziente_cf)
	--REFERENCES paziente(cf)

);

-- ALTERATIONS --

ALTER TABLE medico_specialista
	ADD FOREIGN KEY (id)
	REFERENCES spec_prim(id_specialista)
	DEFERRABLE INITIALLY DEFERRED;


-- FUNCTIONS AND TRIGGERS--

-- 1) V.Spec.PrimIsASpec --

-- INSERIMENTO  SPECIALIZZAZIONE --
CREATE OR REPLACE FUNCTION insert_spec()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF ((NOT EXISTS 
    (SELECT * 
    FROM spec 
    WHERE new.id_specialista = spec.id_specialista 
			AND new.nome = spec.nome))) 
    THEN

      INSERT INTO spec(id_specialista,nome)
        VALUES(NEW.id_specialista, NEW.nome);

  END IF;

	RETURN NEW;

END;
$$;

CREATE TRIGGER v_spec_prim_is_a_spec
  AFTER INSERT
  ON spec_prim
  FOR EACH ROW
  EXECUTE PROCEDURE insert_spec();


-- 2) V.Donazione.Ravvicinate --

-- CONTROLLA DATA DONAZIONE --
CREATE OR REPLACE FUNCTION check_data()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

  IF (NEW.data_donazione < (now() :: date )) 
  	THEN

      RAISE EXCEPTION 'Invalid Data : %', NEW.data_donazione
      USING HINT = 'Non puoi prenotare nel passato.';

  END IF;

  IF ( EXISTS (
    SELECT data_donazione
    FROM   donazione
    WHERE  donatore_cf = NEW.donatore_cf 

	AND (
		data_donazione  >=  (NEW.data_donazione :: date) - INTEGER '90' ) 
		AND
		data_donazione  <=  (NEW.data_donazione :: date) + INTEGER '90')
	)

    THEN
    
      RAISE EXCEPTION 'Invalid Data : %', NEW.data_donazione
      USING HINT = "Devi aspettare 90 giorni dall'ultimo appuntamento.";

  END IF;

  RETURN NEW;

END;
$$;

CREATE TRIGGER v_donazione_ravvicinate
  BEFORE INSERT OR UPDATE
  ON donazione
  FOR EACH ROW
  EXECUTE PROCEDURE check_data();


-- 3) V.Prenotazioni.Ravvicinate -- 

-- CONTROLLO DATA PRENOTAZIONI  --
CREATE OR REPLACE FUNCTION check_pren_time()
RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

  IF (NEW.data_pren < (now() :: date )) 
  THEN

      RAISE EXCEPTION 'Invalid Data : %', NEW.data_pren
      USING HINT = 'Non puoi prenotare nel passato.';

  END IF;

  IF (EXISTS (
	  SELECT data_pren, paziente_cf, ora_pren 
	  FROM prenotazione
	  WHERE paziente_cf = NEW.paziente_cf AND data_pren = NEW.data_pren
	  AND id_specialista = NEW.id_specialista
	  AND 
	  (
		ora_pren >= NEW.ora_pren - 1.00
		AND
		ora_pren <= NEW.ora_pren + 1.00	 
	  )
  	))
  	THEN
		RAISE EXCEPTION 'Invalid time : %', NEW.ora_pren
      	USING HINT = "Appuntamento troppo ravvicinato";
  END IF;

	RETURN NEW;

END;
$$;

CREATE TRIGGER v_prenotazioni_ravvicinate
  BEFORE INSERT OR UPDATE
  ON prenotazione
  FOR EACH ROW
  EXECUTE PROCEDURE check_pren_time();


-- 4) V.Prenotazione.Prescrizione --

-- CONTROLLO PRENOTAZIONI E PRESCRIZIONI --
CREATE OR REPLACE FUNCTION check_exist_precrizione()
RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

  IF ( NOT EXISTS (
	  SELECT codice, paziente_cf
	  FROM prescrizione_paziente
	  WHERE codice = NEW.codice AND paziente_cf = NEW.paziente_cf)

  	)
	THEN

		RAISE EXCEPTION 'Invalid code : %', NEW.codice
      	USING HINT = 'Non esiste una prescrizione associata a questo paziente'; 

  END IF;

  RETURN NEW;

END;
$$; 

CREATE TRIGGER v_prenotazione_prescrizione
  BEFORE INSERT 
  ON prenotazione
  FOR EACH ROW
  EXECUTE PROCEDURE check_exist_precrizione();


-- 5) V.Cancellazione.Prescrizione --

-- CANCELLAZIONE PRESCRIZIONE --
CREATE OR REPLACE FUNCTION delete_precrizione()
RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

	DELETE FROM prenotazione
	WHERE codice = OLD.codice;-- AND paziente_cf = OLD.paziente_cf;

	RETURN OLD;
	
END;
$$; 

CREATE TRIGGER v_cancellazione_prescrizione
  AFTER DELETE
  ON prescrizione
  FOR EACH ROW
  EXECUTE PROCEDURE delete_precrizione();


-- 6) V.Controllo.Medico.Prenotazione --

-- CONTROLLO PRENOTAZIONE --
CREATE OR REPLACE FUNCTION controlla_prenotazione()
RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN

  IF ( NEW.id_specialista NOT IN (
	  SELECT id_specialista
	  FROM medico_osp
	  WHERE  NEW.indirizzo_ospedale = medico_osp.indirizzo)
  	)
	THEN

		RAISE EXCEPTION 'Invalid combination (id, address) : (%, %)', NEW.id_specialista, NEW.indirizzo_ospedale
      	USING HINT = 'Lo specialista selezionato non lavora in questo ospedale'; 

  END IF;

  RETURN NEW;

END;
$$; 

CREATE TRIGGER v_controllo_medico_prenotazione
  BEFORE INSERT
  ON prenotazione
  FOR EACH ROW
  EXECUTE PROCEDURE controlla_prenotazione();



