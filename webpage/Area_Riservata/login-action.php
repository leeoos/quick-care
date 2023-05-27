<?php
namespace Phppot;

//use Phppot\Member;
// Script per la creazione di un Sessione di Log In
// la Sessione scade al momenti di Log Out 
// o alla chiusura del browser

// Se i dati di Log In sono stati ricevuti correttamente:
if (! empty($_POST["login"])) {
    session_start(); // inizializzazione Sessione

    // estrapolazione di username e password
    $username = filter_var($_POST["username"], FILTER_SANITIZE_STRING);
    $pwd = filter_var($_POST["pwd"], FILTER_SANITIZE_STRING);

    // importazione e valutazione del file member.php responsabile 
    // dell'instanziamento di un nuovo membro per la Sessione 
    require_once (__DIR__ . "/Class/member.php"); 
    
    // creazione del nuovo membro e processamento del Log In
    $member = new Member(); 
    $isLoggedIn = $member->processLogin($username, $pwd);
    // setting del messaggio di errore in caso di fallimento del Log In
    if (! $isLoggedIn) {
        $_SESSION["errorMessage"] = "Invalid Credentials";
    }
    // reinirizzamento verso index.php
    header("Location: index.php");
    exit();
}