// Funzioni di ridirezione con messaggi di errore

// Ridirezione dopo un breve periodo di tempo
function redirectAfterSleep(addr, sleep) {
    setTimeout(function(){ window.location = addr; }, sleep);
}

// Ridirezione immediata con alert
function redirectTo(addr, msg) {
    window.alert(msg);
    window.location = addr;
}





