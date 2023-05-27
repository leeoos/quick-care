<!DOCTYPE html>
<html>
    <head>
        <!-- Pagina per la cancellazione di prenotazioni-->
        <title>Cancellazione</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link rel="stylesheet" type="text/css" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/loader.css" >

        <!--Script con funzioni di ridirezione e messaggi di errore-->
        <script type="text/javascript" lang="javascript"
                src="../../JS/page-redirection.js"></script>

    </head>
    <!--Loading Spinning Circle-->
    <body class="text-center">
        <div id="mydiv">
            <h2 >Loading ...</h2> <br>
                <div class="loader" > </div>
        </div>
        
        <!--Redirezione con messagio di errore in caso di mancato invio dei data dalla pagina precedente-->
        <?php if(!isset($_POST['codice'])) { ?>
            <script>
                redirectTo('../../index.html', 'Error: no data recived');
            </script> 
        <?php exit(); } ?>
        <?php 
            $codice = $_POST['codice'];
            $codice = "'".$codice."'";

            $err = "";
            $result = "";

            // Connessione al Database locale quickcare
            $rootDir = realpath($_SERVER["DOCUMENT_ROOT"]);
            include $rootDir.'/WebPage/connect.php';
            $dbconn = connect();

            // esecuzione della Query di cancellazione
            $delete = "DELETE FROM prenotazione 
                        WHERE codice =" .$codice ;

            $result = @pg_query($delete);
            $err = pg_last_error();

        ?>
        <!--Redirezione verso la Homepage in caso di errore-->
        <?php if(!$result): ?>
            <?php json_encode($err);?>
            <script>
                redirectTo('../../index.html', <?php echo json_encode($err);?> );
            </script>
        <?php else: ?>
            <!-- Altrimenti redirezione automatica alla pagina precedente -->
            <script>
                redirectAfterSleep('../index.php', 2000);
            </script>
        <?php endif; ?>

        <?php
        // Reset dell'insieme di risultati
        pg_free_result($result);
        // Chiusura della connessione
        pg_close($dbconn);
        ?>
    </body>
</html>