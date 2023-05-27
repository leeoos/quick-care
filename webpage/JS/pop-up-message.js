// Funzione di conferma cancellazione
// genera un alert di conferma
function cancella() {
    var r = confirm("Sicuro di voler cancellare la Prenotazione?");
    if (r == true) {
        return true;
    } else {
        return false;
    }
}