<h1>Sistema di prenotazione cinema multisala</h1>

<h4>Istruzioni setup database</h4>
Impostare connessione con:
	-User: "root"
	-Password: "root"
	-Porta Standard: "3306"

1. Eseguire cinema.sql per creare il db
2. Importare in ordine:
	-1	data_sala.csv	(NON IMPORTARE LA PRIMA COLONNA ID) (Record importati: 4)
	-2	data_genere.csv	(NON IMPORTARE LA PRIMA COLONNA ID) (Record importati: 6)
	-3	data_film.csv (Record importati: 10)
	-4	data_prezzo.csv (Record importati: 2)
	-5	data_posto.csv (Record importati: 320)
	-6	data_ruolo.csv (Record importati: 2)
	-7	data_utente.csv (Record importati: 3)
