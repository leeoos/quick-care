<!DOCTYPE html>
<html>
    <head>
        <title>Inserimento</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link rel="stylesheet" type="text/css" href="../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../CSS/panel.css" >

        <!--Script con funzioni di ridirezione e messaggi di errore-->
        <script type="text/javascript" lang="javascript"
            src="../JS/page-redirection.js"></script>

        <!--Script con funzione di generazione password -->
        <script type="text/javascript" lang="javascript"
            src="../JS/pwd-generator.js"></script>

        <!--Script con funzione di settaggio di un cookie -->
        <script type="text/javascript" lang="javascript"
            src="../JS/cookie.js"></script>

        <!--Funzione jQuery per l'implementazione di un pannello a scomparsa -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script> 
            $(document).ready(function(){
                $(".flip").click(function(){
                    $(".panel").fadeToggle(1000);
                    display_info();
                });
            });
        </script>

        <!--Funzione jQuery per la creazione di un cookie, richiama a sua volta 
            una funzione JS che setta i parametri del cookie-->
        <script>
            $(document).ready(function () {
                //alert("cookie");
                // il cookie ha lo scopo di mantenere temporaneamente 
                // una password generata casualmente che sara poi assegnata al nuovo paziente
                createCookie("sas", generatePassword(), "10"); 
            });
        </script>

        <!--Funzione JS AJAX per inviare i dati della prenotazione alla pagina info.php 
            ed ottenere le info del paziente se questo e' gia registarto
                Il dati prodotti in echo dalla pagina info.php vengono catturati 
                    dalla proprieta' responsiveText di XMLHttpRequest-->
        <script>
            function display_info() {
                var str = <?php echo json_encode(unserialize($_GET['data']));?>;
                var cf = "'".concat(str[4].concat("'"));
                if (str == "") {
                    document.getElementById("info").innerHTML = "Non info";
                    return;
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("info").innerHTML = this.responseText;
                        }
                    };
                    xmlhttp.open("GET","../info.php?q="+cf,true);
                    xmlhttp.send();
                }
            }
        </script>
    </head>

    <body class="text-center">    
        <!--Redirezione con messagio di errore in caso di mancato invio dei data dalla pagina precedente-->
        <?php if(!isset($_GET['med_osp']) || !isset($_GET['data']) ) { ?>
            <script>
                redirectTo('../index.html', 'Error: no data recived');
            </script>
        <?php exit(); } ?>
        <?php

            // Inizializazione di variabli locali (per sicurezza)
            $err = "";
            $errPat = "";
            $resultPat= "";
            $resultPren= "";

            // Estarpolazione e manipolazione dei dati ricevuti
            // per adattare il formato a quello richiesto dal Database 
            $med_osp = $_GET["med_osp"];
            $med_osp = explode("|", $med_osp);
            $app_data = unserialize($_GET["data"]);
            json_encode(unserialize($_GET["data"]));

            $ora_pren = $app_data[0]; 
            $data_pren = $app_data[1];
            $nome = $app_data[2];
            $cognome = $app_data[3];
            $cf = $app_data[4];
            $telefono = $app_data[5];
            $email = $app_data[6];
            $codice = $app_data[7];
            $prestazione = $app_data[9];

             
            $nome = "'".$nome."'";
            $cognome = "'".$cognome."'";
            $cf = "'".$cf."'";
            $telefono = "'".$telefono."'";
            $email = "'".$email."'";
            $codice = "'".$codice."'";
            $pwdH = "'".md5($_COOKIE["sas"])."'"; //codifica della password in md5
            $via = "'".$med_osp[2]."'";
            $civico  = "'".$med_osp[3]."'";
            $citta = "'".$med_osp[4]."'";
            $id = "'".$med_osp[7]."'";

            // Connessione al Database locale quickcare
            include '../connect.php';
            $dbconn = connect();
    
            // Esecuzione della Query per l'inserimento del paziente
            $insertPat=
            "INSERT INTO paziente (cf, nome, cognome, pwd,  num_tel) 
                VALUES (
                ".$cf.", 
                ".$nome.", 
                ".$cognome.",
                ".$pwdH.", 
                ".$telefono.");
            ";
            $resultPat = @pg_query($insertPat); // or die('Query failed: ' . pg_last_error());
            $errPat = pg_last_error();

            // Esecuzione della query per l'inserimento della prenotazione
            $insertPren = "INSERT INTO prenotazione (codice, paziente_cf, 
                indirizzo_ospedale.via, indirizzo_ospedale.civico, indirizzo_ospedale.citta, 
                id_specialista, data_pren, ora_pren, tipo, descrizione )
                VALUES (
                ".$codice.",
                ".$cf.",
                ".$via.",
                ".$civico.",
                ".$citta.",
                ".$id.",
                ("."'".$data_pren."'"." :: date), 
                "."'".$ora_pren."'".",
                ".$prestazione.",
                'Visita')";

            $resultPren = @pg_query($insertPren);
            $err = pg_last_error();
        ?>
            <!-- In caso di fallimento della Query:cancellazione del paziente appena registrato e 
                reindirizamento dell'utente alla Homepage, con messaggio di errore-->
            <?php if(!$resultPren): ?>
                <?php
                    if($resultPat){
                        $delete = "DELETE FROM paziente WHERE cf =".$cf;
                        @pg_query($delete); // un paziente gia inserito non viene cancellato 
                        //perche' questo violerebbe il vincolo di foreign key nel DB
                    }
                ?>
                <?php json_encode($err);?>
                    <script>
                        redirectTo('./prenotazione.html', <?php echo json_encode($err);?> );
                    </script>

            <?php else: ?>
                <!-- In caso di sucesso della Query, se il paziente era gia presente nel Batabase 
                    viene generato un pannello con il recup dei suoi dati personali-->
                <?php if(!$resultPat): ?>
                    <?php json_encode($cf);?>
                    <p class="flip" >
                    Paziente già registarato, clicca per vedere le info</p>
                    <div class="panel">
                        <p id="info"> paziente </p>
                    </div>
                <?php else: ?>
                <!-- Altrimenti viene comunicato l'inserimento nel Database fornendo all'utente la password-->
                    <?php json_encode($_COOKIE["sas"]);?>
                    <script>
                        alert('Inserimento Avvenuto, password: '.concat(<?php echo json_encode($_COOKIE["sas"]);?>));
                    </script>
                <?php endif; ?>

                <br><br>
                <!-- Area con Recap dei dettagli dell'appuntamento -->
                <div>
                    <h2> Dettagli Appuntamento </h2>
                    <?php
                        // Funzioni php per la formattazione dei dati da mostrare all'utente (rimozione di caratteri speciali)
                        $via = str_replace( array("'"), '', $via);
                        $civico = str_replace( array("'"), '', $civico);
                        $citta = str_replace( array("'"), '', $citta);
                        function formatData($data_pren) {
                            $data_pren = explode("-", $data_pren);
                            return  $data_pren[2]." / ".$data_pren[1]." / ".$data_pren[0];
                        }
                        echo '<br><p style="font-size:25px"> <b>Ospedale: '.$via.", ".$civico.", ".$citta. "</b></p>";
                        echo '<p style="font-size:25px"><b>Data: '.formatdata($data_pren)."</b></p>";
                        echo '<p style="font-size:25px"><b>Orario: '.$ora_pren."</b></p><br>";
                    ?>
                </div>
                <br><br>
                <a href="../index.html" role="button" class="btn btn-primary btn-lg">
                    Torna alla Home </a>
            <?php endif; ?>

        <?php
            // Reset dell'insieme di risultati
            pg_free_result($resultPren);
            // Chiusura della connessione
            pg_close($dbconn);
        ?>
    </body>
</html>
