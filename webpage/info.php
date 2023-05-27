<!DOCTYPE html>
<html>
    <head>
        <title>Info</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>

    </head>
    <body>
    <?php if(!isset($_GET['q'])) { ?>
            <script>
                redirectTo('../home.html', 'Error: no data recived');
            </script>
        <?php exit(); } ?>
        <?php
            $cf = $_GET['q'];

            //$dbconn = pg_connect("host=localhost port=5432
                //dbname=quickcare user=leeoos password=password")
                //or die('Could not connect: ' . pg_last_error());

            // Connessione al Database locale quickcare
            include 'connect.php';
            $dbconn = connect();

            $info="SELECT nome, cognome
                    FROM  paziente
                    WHERE cf = ".$cf;

            $result = pg_query($info);

            if (pg_num_rows($result) == 0 ) {
                echo "<p>No patient found</p>";
            }

            $line = pg_fetch_row($result);
            $cf = str_replace( array("'"), '', $cf);
            echo $cf."<br>";
            echo implode(", ", $line);

            // Free resultset
            pg_free_result($result);
            // Closing connection
            pg_close($dbconn);

        ?>
    </body>
</html>