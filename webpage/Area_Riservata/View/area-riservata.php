<!DOCTYPE html>
<html>
    <head>
        <!--Area Riservata per la gestione delle prenotazioni-->
        <title>Area Riservata</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link rel="stylesheet" type="text/css" href="../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../CSS/navbar.css" >
        <link rel="stylesheet" type="text/css" href="../CSS/table.css" >
        <link rel="stylesheet" type="text/css" href="../CSS/panel.css" >

        <!-- script JS con funzione per messaggio di conferma -->
        <script type="text/javascript" lang="javascript"
            src="../JS/pop-up-message.js"></script>

        <!--Script con funzioni di ridirezione e messaggi di errore-->
        <script type="text/javascript" lang="javascript"
            src="../../JS/page-redirection.js"></script>

        <!--Funzione jQuery per l'implementazione di una barra di ricerca -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
        </script>

        <!--Funzione jQuery per l'implementazione di un pannello a scomparsa -->
        <script> 
            $(document).ready(function(){
                $("#flip").click(function(){
                    $(".panel").fadeToggle(1000);
                    getInfo();
                });
            });
        </script>

        <!--Funzione JS AJAX per inviare lo user ID dell'utente alla pagina info.php ed ottenere le info 
                Il dati prodotti in echo dalla pagina info.php vengono catturati
                    dalla proprieta' responsiveText di XMLHttpRequest-->
        <script>
            function getInfo() {
                var str = <?php echo json_encode($_SESSION["userId"])?>; 
                str = "'".concat(str.concat("'"));
                if (str == "") {
                    document.getElementById("info").innerHTML = "Error 404";
                    return;
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("info").innerHTML = this.responseText;
                        }
                    };
                    xmlhttp.open("GET","../info.php?q="+str,true);
                    xmlhttp.send();
                }
            }            
        </script>
    </head>
    <body>
       <!--Redirezione con messagio di errore in caso di mancato invio dei data dalla pagina precedente-->
        <?php if(!isset($_SESSION["userId"])) { ?>
                <script>
                    redirectTo('../../index.html', 'Error: no active session found');
                </script>
        <?php exit(); } ?>
        <?php 
            $username = $_SESSION["userId"];

            // Connessione al Database locale quickcare
            $rootDir = realpath($_SERVER["DOCUMENT_ROOT"]);
            include $rootDir.'/WebPage/connect.php';
            $dbconn = connect();

            $username = $_SESSION["userId"];

            // Esecuzione della Query per ottenener l'elenco degli appuntamenti relativi all'utente
            $query = '  SELECT codice, indirizzo_ospedale, data_pren, ora_pren, descrizione, cognome
                        FROM prenotazione, medico_specialista
                        WHERE paziente_cf = '."'".$username."' AND
                                id_specialista = id"; 

            $result = pg_query($query) or die('Query failed: ' . pg_last_error());
        ?>

        <!-- Inserimento della Barra di Navigazione -->
        <div class="topnav">
            <a class="active" href="../index.html">Indietro</a>
            <div class="btn">
                <button class="btn" id="flip"> Dati Personali </button>
            </div>
            <div class="login-container">
            <form action="./logout.php">
              <button type="submit">Log Out</button>
            </form>
          </div>
        </div>

        <!-- Pannello a scomparsa con le info del paziente -->
        <div class="panel">
            <p id="info"> paziente </p>
        </div>
        <?php json_encode($_SESSION["userId"])?>
 
        <div id="lista_pren">
            <div class="text-center" >
                <h2>Elenco Appuntamenti</h2>
                <br>
                    
                    <p>Cerca tra le prenotazioni effettuate</p>  
                    <input id="myInput" type="text" placeholder="Search.." style="width:300px;">
                <br><br>

                <table>
                    <thead>
                        <tr>
                        <th>Codice Prescrizione</th>
                        <th>Indirizzo dell'Ospedale</th>
                        <th>Data appuntamento</th>
                        <th>Ora Appuntamento</th>
                        <th>Prestazione Richiesta</th>
                        <th>Medico</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                <?php
                    // Funzioni php per la formattazione dei dati da mostrare all'utente (rimozione di caratteri speciali)
                    function formatData($data_pren) {
                        $data_pren = explode("-", $data_pren);
                        return  $data_pren[2]." / ".$data_pren[1]." / ".$data_pren[0];
                    }
                    function removeSpecialChar($indirizzo) {
                        $new_indirizzo = str_replace( array('"',
                        '(' , ')'), '', $indirizzo);
                        $new_indirizzo = str_replace( array(','), 
                        ', ', $new_indirizzo);
                        return $new_indirizzo;
                    }
                    // spampa in 'echo' dei risultati della Query sottoforma di tabella 
                    // con relativo pulsante di cancellazione
                    while($row = pg_fetch_array($result)) {
                        $codice = $row['codice'];
                        $data_pren = formatData($row['data_pren']);
                        $indirizzo = removeSpecialChar($row['indirizzo_ospedale']);
                        echo "<tr>";
                        echo "<td>" . $codice . "</td>";
                        echo "<td>" . $indirizzo . "</td>";
                        echo "<td>" . $data_pren  . "</td>";
                        echo "<td>" . $row['ora_pren'] .":00" . "</td>";
                        echo "<td>" . $row['descrizione'] . "</td>";
                        echo "<td>" ."Dr. " .$row['cognome'] . "</td>";
                        // chiamata all funzione di conferma prima di eseguire la cancellazione
                        echo "<td>" .'<form action="View/cancellazione.php" method="POST" name="formCanc" 
                                onsubmit="return cancella()">
                                <button  class="btn btn-primary btn-lg" 
                                type="submit" name="codice" class="button" value="'.$codice.'" 
                                >Cancella Prenotazione</button>';
                        echo "</tr>";
                    }
                    echo "</tbody>";
                    echo "</table></div>";

                    // Reset dell'insieme di risultati
                    pg_free_result($result);

                    // Chiusura della connessione
                    pg_close($dbconn);
                ?>
            </div>
        </div>
    <body>
</html>