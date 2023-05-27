<?php
namespace Phppot;

// Creazione di una Classe Membro da assegnare ad una nuova Sessione
class Member
{   
    // Funzione php per il processamento del Log In
    public function processLogin($username, $pwd) {
        // Connessione al Database locale quickcare
        $rootDir = realpath($_SERVER["DOCUMENT_ROOT"]);
        include $rootDir.'/WebPage/connect.php';
        $dbconn = connect();

        // codifica della password in md5
        $pwdH = md5($pwd);

        // esecuzione della Query per il controllo delle credenziali:
        // in caso username e password corrispondono restituisce il cf del pasiente
        $query = '  SELECT cf 
                    FROM paziente
                    WHERE pwd = '."'".$pwdH."'".'
                    AND cf = '."'".$username."'";
        $result = pg_query($query) or die('Query failed: ' . pg_last_error());

        // Se la Query produce un risultato questo viene salvato in $_SESSION["userId"]
        // come identificativo per la nuova Sessione
        if(pg_num_rows($result) != 0) {
            $row = pg_fetch_row($result);
            $_SESSION["userId"] = $row[0]; // Codice Fiscale del paziente
            return true;
        }
        // altrimenti il login fallisce
    }
}
?>