<!DOCTYPE html>
<html>
    <head>
        <!--Esecuzione della Query e stampa dei risultati-->
        <title>Orari</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link rel="stylesheet" type="text/css" href="../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../CSS/table.css" >

        <!--Script con funzioni di ridirezione e messaggi di errore-->
        <script type="text/javascript" lang="javascript"
            src="../JS/page-redirection.js"></script>

    </head>
    <body>
        <!--Redirezione con messagio di errore in caso di mancato arrivo dei data dalla pagina precedente-->
        <?php if(!isset($_GET['q'])) { ?>
            <script>
                redirectTo('../index.html', 'Error: no data recived');
            </script>
        <?php exit(); } ?>

        <?php
            // Estarpolazione e manipolazione dei dati ricevuti
            // per adattare il formato a quello richiesto dal Database 
            $q = $_GET['q'];
            $app_data = explode(",", $q); 
            $ora_pren = $app_data[0]; 
            $data_pren = $app_data[1];
            $cf = $app_data[4];
            $codice = $app_data[7];
            $prestazione = $app_data[9]; 

            $ospSpec = "";
            $formatOsp = array();

            // Connessione al Database locale quickcare
            include '../connect.php';
            $dbconn = connect();

            // Esecuzione di due query per la selezione degli ospedali primari e secondari
            $queryPrim = '  SELECT  ospedale.nome, (ospedale).indirizzo.via, (ospedale).indirizzo.civico,
                                    (ospedale).indirizzo.citta, ospedale.telefono, medico_specialista.cognome,
                                    medico_specialista.id
                            FROM ospedale, medico_osp, medico_specialista
                            WHERE medico_osp.id_specialista = medico_specialista.id AND
                                ospedale.indirizzo = medico_osp.indirizzo AND
                                medico_osp.id_specialista IN ( 
                                SELECT DISTINCT id_specialista
                                FROM medico_osp
                                WHERE   medico_osp.id_specialista IN (
                                        SELECT DISTINCT id_specialista 
                                        FROM  spec_prim
                                        WHERE '.$prestazione.' = nome )
                                AND medico_osp.id_specialista NOT IN (
                                        SELECT id_specialista 
                                        FROM prenotazione
                                        WHERE  
                                            ( 
                                                prenotazione.data_pren = ('."'".$data_pren."'".' :: date ) AND
                                                prenotazione.ora_pren = '."'".$ora_pren."'".'
                                            )
                                )
                            
                            )';

            $querySec = '   SELECT ospedale.nome, (ospedale).indirizzo.via, (ospedale).indirizzo.civico,
                                    (ospedale).indirizzo.citta, ospedale.telefono, medico_specialista.cognome,
                                    medico_specialista.id
                            FROM ospedale, medico_osp, medico_specialista
                            WHERE medico_osp.id_specialista = medico_specialista.id AND
                                ospedale.indirizzo = medico_osp.indirizzo AND
                                medico_osp.id_specialista IN ( 
                                SELECT DISTINCT id_specialista
                                FROM medico_osp
                                WHERE medico_osp.id_specialista IN (
                                    SELECT DISTINCT id_specialista 
                                    FROM  spec
                                    WHERE '.$prestazione.' = nome 
                                        AND id_specialista NOT IN(
                                        SELECT DISTINCT id_specialista 
                                        FROM  spec_prim
                                        WHERE '.$prestazione.' = nome
                                        ))
                                    AND medico_osp.id_specialista NOT IN (
                                        SELECT id_specialista 
                                        FROM prenotazione
                                        WHERE  
                                            ( 
                                                prenotazione.data_pren = ('."'".$data_pren."'".' :: date) AND
                                                prenotazione.ora_pren = '."'".$ora_pren."'".'
                                            )
                                    )
                            )';

            $resultPrim = pg_query($queryPrim) or die('Query failed: ' . pg_last_error());
            $resultSec = pg_query($querySec) or die('Query failed: ' . pg_last_error());
            
            // stampa in 'echo' dei risultati della Query sottoforma di tabella, se disponibili
            if (pg_num_rows($resultPrim) == 0 and pg_num_rows($resultSec) == 0) {
                echo "<p>Non ci sono date disponibile per la prestazione richiesta</p>";
            }
            else {
                function displayResults($result){
                    global $ospSpec, $formatOsp, $app_data;
                    while ($line = pg_fetch_row($result)) { 
                        foreach ($line as $col_value) {
                            array_push($formatOsp, $col_value);
                            $ospSpec = $ospSpec."|".$col_value;
                        }
                        echo "<tr>";
                            echo "<td>" . $formatOsp[0] . "</td> <t>";
                            echo "<td>" . $formatOsp[1] . "</td> <t>";
                            echo "<td>" . $formatOsp[2] . "</td> <t>";
                            echo "<td>" . $formatOsp[3] . "</td> <t>";
                            echo "<td>" . $formatOsp[4] . "</td> <t>";
                            echo "<td>" ."Dr. " . $formatOsp[5] ."</td> ";
                        
                        echo '
                        <td>
                            <a class="btn btn-primary btn-lg" 
                            href="inserimento.php?med_osp='.$ospSpec."&data=".htmlspecialchars(serialize($app_data)).'" > Prenota </a>
                        </td>';
                        echo "</tr>";
                        $ospSpec = "";
                        $formatOsp = array();
                    }

                }
                echo '
                <table>
                    <thead>
                        <tr>
                            <th>Ospedale</th>
                            <th>Via </th>
                            <th>Numero Civico</th>
                            <th>Citta</th>
                            <th>Telefono</th>
                            <th>Medico</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                ';
                displayResults($resultPrim);
                displayResults($resultSec);
                echo '</tbody>';
                echo '</table>';
            }
            // Reset dell'insieme di risultati
            pg_free_result($resultPrim);
            pg_free_result($resultSec);

            // Chiusura della connessione
            pg_close($dbconn);

        ?>
    </body>
</html>