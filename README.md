# Quick Care

Quick Care è un sito web per la prenotazione online di prestazioni sanitarie negli ospedali conenzionati con il sistema sanitario della Regione Lazio.

## Struttura del Progetto

Vi sono due comeponenti principali:

- Un sito web che mette a disposizione dell'utente la possibilità di prenotare una prestazione sanitaria  completamente online;  
- Un Database di supporto in cui è possibile inserire dati relativi:

    * agli ospedali convenzionati; 
    * ai medici che vi lavorano; 
    * ai pazienti che effettuano prenotazion;
    * alle prescrizioni relative a tali pazienti; 
    * ai medici di base che rilasciano le prescrizioni; 

  

## Come inizializzare e popolare il database
Per costruire il Database di QuickCare in un sistema ``postgres`` esegui i comandi:

```
CREATE DATABASE quickcare;

\i QuickCare/Database/database.sql
```

Per popolare il Database:

```
\i QuickCare/Database/data_samples.sql
```
## Come testare il sito
Dopo aver scaricato il codice sorgente sarà possibile testare l'applicazione caricando la cartella WebPage su localhost.

Una volta popolato il Database tre classi di codici di prenotazione saranno resi disponibili, ogni classe sarà associata ad uno degli utenti di prova, i cui dati, necessari per richiedere una prestazione sanitaria, sono riportati qui sotto:


| Nome          | Cognome       | Codice fiscale   | Email             | Telefono      | Classe   |
|:-------------:|:-------------:|:----------------:|:-----------------:|:-------------:|:--------:|
| Lucilla       | Fragala       | FRGLLL25L65B960D | l.fraga@gmail.com | 555-72345     |    A     |
| Giusto        | Orsini        | RSNGST16B17H861J | g.orso@gmail.com  | 555-32163     |    B     |
| Placido       | Danesi        | DNSPCD43C29E910S | pla.dan@gmail.com | 555-93526     |    C     |

Ad ogni Classe sono associati sei Codici Ricetta relativi ai rispettivi pazienti che posso essere utilizzati per effettuare prenotazioni di prova. Un Codice Ricetta è del tipo ``Xn`` dove ``X`` è la classe del codice di prenotazione ed ``n`` in questo caso è un numero tre 1 e 6.

Per esempio è possibile effetuare una prenotazione per làutente Lucilla Fragala compilando il form con i dati riportati in tabella ed utilizzando il Codice Ricetta ``A1``.


