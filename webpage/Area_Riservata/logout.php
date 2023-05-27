<?php 
// script di Log Out:
session_start();

// resetta lo user ID
$_SESSION["userId"] = "";

// distrugge la sessione
session_destroy();

// reindirizza verso index.php (che portera alla pagina di Log In)
header("Location: index.php");
?>
