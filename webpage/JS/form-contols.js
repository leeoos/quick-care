// Inizializzazione di variabili di controllo
var prestazione = null;
var privacyInfo = null;
var specialCharOne = "/ \\ [ ! ?  < > @ # $ % ^ & * ";
var specialCharTow = "( ) _ + - = [ ] { } \" ' ; : , . ";

//Funzioni di controllo

// Controllo che il nome sia stato inserito 
// non sia un numero
// non contenga caratteri speciali
function checkName() {
    var nome = document.formPren.name.value;
    if (nome == ""){
        alert("Inserire il Nome");
        return false;
    }
    if (!isNaN(parseInt(nome))) {
        alert("Il Nome non puo' essere un numero");
        return false;
    }
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if(format.test(nome)){
        alert("Il Nome non puo contenere i seguenti caratteri speciali\n".concat(specialCharOne).concat(specialCharTow));
        return false;
    }
    return true;
}

// Controllo che il cognome sia stato inserito 
// non sia un numero
// non contenga caratteri speciali
function checkSurName() {
    var cognome = document.formPren.surname.value;
    if (cognome == ""){
        alert("Inserire il Cognome");
        return false;
    }
    if (!isNaN(parseInt(cognome))) {
        alert("Il Cognome non puo' essere un numero");
        return false;
    }
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if(format.test(cognome)){
        alert("Il Cognome non puo contenere i seguenti caratteri speciali\n".concat(format));
        return false;
    }
    return true;
}

// Controllo che il codice fiscale sia stato inserito 
// non sia un numero
// non contenga caratteri speciali
function checkCF() {
    var cf = document.formPren.cf.value
    if (cf == ""){
        alert("Inserire il Codice Fiscale");
        return false;
    }
    if (!isNaN(parseInt(cf))) {
        alert("Il Codice Fiscale non puo' essere un numero");
        return false;
    }
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if(format.test(cf)){
        alert("Il Codice Fiscale non puo contenere i seguenti caratteri speciali\n".concat(format));
        return false;
    }
    if (cf.length < 16 || cf.length > 16) {
        return false;
    }
    return true;
}

// Controllo che il codice ricetta sia stato inserito
function checkCode() {
    var code = document.formPren.codice.value
    if (code == ""){
        alert("Inserire il Codice della ricetta");
        return false;
    }
    return true;
}

// Controllo che la mail sia stata inserita
function checkEmail() {
    var code = document.formPren.email.value
    if (code == ""){
        alert("Inserire l'indirizzo e-mail");
        return false;
    }
    return true;
}

// Funzione di validazione del Form 
// richiama in automatico tutte le funzioni di controllo
function validForm() {

    if (! checkName()) {
        return false;
    }
    
    if (! checkSurName()) {
        return false;
    }

    if (! checkCF()) {
        return false;
    }

    if (! checkEmail()) {
        return false;
    }

    if (! checkCode()) {
        return false;
    }

    if (privacyInfo == null) {
        alert("Acconsenti alll'informativa");
        return false;
    }

    if (document.formPren.prestazione.value == "null") {
        alert("Selezionare una Prestazione");
        return false;
    }

    return true;
}

