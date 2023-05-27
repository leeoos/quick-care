<html>
    <head>
        <!--Pagina di Log In-->
        <title>Login</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=yes"/>
        <meta name="author" content="S&C">

        <link  rel="stylesheet" type="text/css" href="./../CSS/style.css" />
        <link rel="stylesheet" type="text/css" href="./../CSS/navbar.css" />

    </head>
<body>
    <div>
    <!-- Inserimento della Barra di Navigazione -->
    <div class="topnav">
          <a class="active" href="../index.html">Indietro</a>
        </div>
        <!-- Form di Log In che invia i dati a login-action.php-->
        <form action="./login-action.php" method="post" id="formLogin" onSubmit="return validate();">
            <div class="demo-table">

                <div class="form-head">Login</div>
                <?php // Controllo messaggio di errore nella generazione della Sessione (Credenziali Errate)
                if(isset($_SESSION["errorMessage"])) {
                echo '<div class="error-message">' .$_SESSION["errorMessage"].'</div>';
                unset($_SESSION["errorMessage"]);
                } ?>
                <!-- Area di Log In-->
                <div class="field-column">
                    <div>
                        <label for="username">Codice Fiscale</label><span id="user_info" class="error-info"></span>
                    </div>
                    <div>
                        <input name="username" id="username" type="text"
                            class="demo-input-box">
                    </div>
                </div>

                <div class="field-column">
                    <div>
                        <label for="pwd">Password</label><span id="password_info" class="error-info"></span>
                    </div>
                    <div>
                        <input name="pwd" id="pwd" type="password"
                            class="demo-input-box">
                    </div>
                </div>

                <div class=field-column>
                    <div>
                        <input type="submit" name="login" value="Login"
                        class="btnLogin"></span>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>