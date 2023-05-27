<?php
    // Indice di indirizzamento all'interno dell'Area Riservata
    @session_start();
    
    // se la sessione e' attiva consente l'accesso automatico 
    // all'Area Riservata importando la pagina area-riservata.php
    if(!empty($_SESSION["userId"])) {
        require_once 'View/area-riservata.php';
    // altrimenti riporta alla pagina di Log In
    } else {
        require_once 'View/login.php';
    }
?>