<!DOCTYPE html>
<html>
    <head>
        <!--Elenco degli ospedali disponibili-->
        <title>Ospedali</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link rel="stylesheet" type="text/css" href="../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../CSS/navbar.css" >

        <!--Script con funzioni di ridirezione e messaggi di errore-->
        <script type="text/javascript" lang="javascript"
            src="../JS/page-redirection.js"></script>

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
        
        <!--Funzione in JS eseguita onload per ottenere la data corrente e settarla come 
            valore predefinito degli attributi min and value nel campo input data_pren del form -->
        <script>
            function getData(){
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; 
                var yyyy = today.getFullYear();
                if(dd<10){
                        dd='0'+dd
                    } 
                    if(mm<10){
                        mm='0'+mm
                    } 

                today = yyyy+'-'+mm+'-'+dd;
                document.getElementById("data_pren").setAttribute("value", today);
                document.getElementById("data_pren").setAttribute("min", today);
            }
        </script>

        <!--Funzione JS AJAX per inviare i dati della prenotazione, tramite XMLHttpRequest, 
            alla pagina orari.php responsabile di eseguire la Query
                Il risulato della Query, prodotto in echo dalla pagina orari.php viene catturato 
                    dalla proprieta responsiveText di XMLHttpRequest-->
        <script> 
            function refresh(str) {

                var ora_pren = document.getElementById("ora_pren").value;
                var data_pren = document.getElementById("data_pren").value;
                var app_data = <?php echo json_encode(array_values($_POST));?>                
                app_data.unshift(ora_pren, data_pren);

                if (str == "") {
                    document.getElementById("lista_osp").innerHTML = "Non ci sono date disponibile per la prestazione richiesta";
                    return;

                } else {

                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {

                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("lista_osp").innerHTML = this.responseText;
                        }
                    };

                    xmlhttp.open("GET","orari.php?q="+app_data,true);
                    xmlhttp.send();
                }
                var p = document.getElementById("myPanel");
                if (p.style.display == "none"){
                    $(".panel").toggle();
                }   
            }

        </script> 
    </head>

    <body class="text-center" onload="return getData()">         
        <?php json_encode(array_values($_POST)); // encoding in json dell'array Post per la lettura da JS?>
        <?php   
            // Controllo che i dati siano stati inviati correttamente dalla pagina precedente 
            function error() {
                $data_set = array("name","surname","cf","email");
                foreach ($data_set as $elem) {
                    if(($_SERVER['REQUEST_METHOD'] == 'POST' || $_SERVER['REQUEST_METHOD'] == 'GET') 
                            && !(isset($_POST[$elem]))) return true;
                }
            }   
        ?>
        <!-- Se i dati non sono arrivati correttamente l'utente viene ridirezionato 
            alla Homepage con un messaggio di errore -->
        <?php  if (error()): ?> 
            <script>
                redirectTo('../index.html', 'Error: no data recived');
            </script>
        <?php exit(); ?>
    
        <?php else: ?> 
            <!-- Inserimento della Barra di Navigazione -->
            <div class="topnav">
                <a class="active" href="./prenotazione.html">Indietro</a>
            </div>
            <br>
                <h1> Tabella Ospedali Disponibili </h1>
            <br>
            <!-- Area per la selezione della data e dell'ora 
                onchange viene richiamata la funzione AJAX refersh-->
            <div>
                <form id="formOrari" method="POST">
                    <h2>Seleziona una data ed una fascia oraria</h2>
                    <select id="ora_pren" name="ora_pren" 
                        onchange="refresh(this.value)" required>
                    <option value="8.00">00:00</option>
                    <option value="8.00">8:00-9:00</option>
                    <option value="10.00">10:00-11:00</option>
                    <option value="12.00">12:00-13:00</option>
                    <option value="14.00">14:00-15:00</option>
                    <option value="16.00">16:00-17:00</option>
                    <option value="18.00">18:00-19:00</option>
                    <option value="20.00">20:00-22:00</option>
                    </select>

                    <input type="date" id="data_pren" name="data_pren" value="2021-05-25" min="2021-05-25" 
                        max="3000-12-31" onchange="refresh(this.value)" required>
                    <br> <br>
                </form>
            </div> 
            <!-- Barra di ricerca inizialmente nascosta-->
            <div style="display: none;" class="panel" id="myPanel">
                <p>Cerca tra gli ospedali disponibili</p>  
                <input id="myInput" type="text" placeholder="Search.." style="width:300px;">
            </div>
            <br><br>
            <!-- Area in cui sara mostatata la tabella degli gli ospedali disponibili 
                con i relativi pulsanti per la prenotazione-->
            <div id="lista_osp"><p style="font-size:20px"><b>Gli Ospedali disponibili saranno elencati di seguito 
                dopo aver  selezionato la data scelta</b></p></div>

        <?php endif; ?>
    </body>
</html>

