s = [
"'cardiologia'",
"'dermatologia'",
"'endocrinologia'",
"'fisiatria'",
"'gastroenterologia'",
"'ginecologia'",
"'neurologia'",
"'oculistica'",
"'oncologia'",
"'ortopedia'",
"'otorinolaringoiatra'",
"'pneumologia'",
"'urologia'",
"'ecografia'",
"'elettromiografia'",
"'radiologia'"
]

t = [
"'Cardiologo'",
"'Dermatologo'",
"'Endocrinologo'",
"'Fisiatra'",
"'Gastroenterologo'",
"'Ginecologo'",
"'Neurologo'",
"'Oculista'",
"'Oncologo'",
"'Ortopedico'",
"'Otorino'",
"'Pneumologo'",
"'Urologo'",
"'Ecografista'",
"'Cardiologo'",
"'Radiologo'"
]

########################################################################################################################################

a = [
"'Domenico'",         
"'Nuschese'",         
"'Demasi'",              
"'Tufo'",              
"'Mezzi'",              
"'Findanno'",               
"'Vaccarezza'",                
"'Peretti'",               
"'Degrossi'",              
"'Folletti'",         
"'Canevisio'",          
"'Falbo'",           
"'Zurru'",         
"'Colavita'",            
"'Govoni'",            
"'Maccario'",  
]

b = [
"'Gianmario'",
"'Nicoletta'",
"'Damiano'",
"'Ezio'",
"'Manlio'",
"'Adriano'",
"'Pippo'",
"'Monica'",
"'Silvana'",
"'Marina'",
"'Piero'",
"'Annamaria'",
"'Bruno'",
"'Leonardo'",
"'Flavio'",
"'Orietta'"
]

for i in range(0, 16) :
    print ( "INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES (",b[i],",",a[i],",",t[i],");")
    print ("INSERT INTO spec_prim(nome) VALUES (",s[i],");")
    print("INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Piazza S. Onofrio', '332', 'Roma');")
    print()

########################################################################################################################################

c = [
"'Bolmida'",         
"'Azara'",         
"'Cavalcabò'",              
"'Peveri'",              
"'Marturana'",              
"'Espositi'",               
"'Casiello'",                
"'Allegranza'",               
"'Bottigli'",              
"'Oddone'",         
"'Gorrara'",          
"'Armellin'",           
"'Siro'",         
"'Rotelli'",            
"'Scattoni'",            
"'Battelli'",  
]

d = [
"'Gregorio'",
"'Duilio'",
"'Aurelia'",
"'Francesca'",
"'Efrem'",
"'Sebastiano'",
"'Dina'",
"'Boris'",
"'Melchiorre'",
"'Egidio'",
"'Elide'",
"'Maurilio'",
"'Gualtiero'",
"'Silvestro'",
"'Ginevra'",
"'Susanna'"
]

for i in range(0, 16) :
    print ( "INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES (",d[i],",",c[i],",",t[i],");")
    print ("INSERT INTO spec_prim(nome) VALUES (",s[i],");")
    print("INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Portuense', '1035', 'Roma');")
    print()

####################################################################################################################################################

e = [
"'De Vito'",         
"'Rolla'",         
"'Baglio'",              
"'Forastieri'",              
"'Piloti'",              
"'Nerli'",               
"'Monachini'",                
"'Berti'",               
"'Bergami'",              
"'Striano'",         
"'Sammarco'",          
"'Cerasa'",           
"'Griffini'",         
"'Micossi'",            
"'Di Napoli'",            
"'Muselli'",  
]

f = [
"'Rachele'",
"'Valter'",
"'Riccardo'",
"'Oronzo'",
"'Debora'",
"'Tiziana'",
"'Rosario'",
"'Ludovico'",
"'Adamo'",
"'Onorio'",
"'Ezechiele'",
"'Landolfo'",
"'Valentino'",
"'Semplicio'",
"'Emanuele'",
"'Iginio'"
]

for i in range(0, 16) :
    print ( "INSERT INTO medico_specialista (nome,cognome,nome_spec) VALUES (",f[i],",",e[i],",",t[i],");")
    print ("INSERT INTO spec_prim(nome) VALUES (",s[i],");")
    print("INSERT INTO medico_osp (indirizzo.via, indirizzo.civico, indirizzo.citta) VALUES ('Via Amba Aradam', '8', 'Roma');")
    print()
