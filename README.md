# Progetto_WEB_2017
<!DOCTYPE html>

<html lang="it">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title> Introduzione alla programmazione web: Progetto finale</title>
		<link href="bootstrap.css" rel="stylesheet">
		<link href="bootstrap-theme.css" rel="stylesheet">
	</head>

	<body>

		<nav class="navbar navbar-default navbar-fixed-top">
			<h1>Progetto Finale: Sito E-commerce <small>Versione: 04 (24-05-2017)</small></h1>

  		<div class="container">
				<a class="nav-item nav-link" href="#">Features</a>
      	<a class="nav-item nav-link" href="#">Pricing</a>
  		</div>
		</nav>
		<br />
		<div>
			<h3>SCOPO</h3>
			<p>Si vuole progettare un sistema di vendita online e classificazione dei venditori da esporre via WEB e fruibile per dispositivi sia desktop che mobile in modalità responsive. L’applicazione deve essere sviluppata con tecnologia Servlet/JSP/JSTL ed ove fosse conveniente a vostra scelta web-services, CSS, javascript
			</p>
		</div>
		<br>
		<div>
			<h3>PUNTI DA IMPLEMENTARE</h3>
				<p>Il sistema prevede:
					<ul>
						<li>Un motore di ricerca che permetta di visualizzare un elenco di oggetti in vendita in base a varie tipologia di scelta tra cui dovranno esserci:
							<ul>
								<li>Per Categoria;</li>
								<li>Per Oggetto;</li>
								<li>Per venditore [5+];</li>
							</ul>
						</li>
						<li>Un filtro sulla ricerca per:
							<ul>
								<li>Zona Geografica</li>
								<li>Prezzo</li>
								<li>Costumer Review</li>
							</ul>
						</li>
						<li>Un sistema di review degli oggetti venduti (da intendere come oggetti, non come qualità del servizio di vendita, da dettagliare, con stelline);</li>
						<li>Un sistema di classificazione dei venditori che dipende dalla qualitàa’ del servizio di vendita e postvendita ricevuto [5+] (devi tenere traccia che l’oggetto è arrivato);</li>
						<li>La possibilità, per il venditore, di inserire una o più fotografie legate agli oggetti in vendita;</li>
						<li>La possibilitaà’, per gli utenti registrati, di lasciare una review sull’oggetto comperato.</li>
						<li>La possibilità, per gli utenti registrati di lasciare una recensione per il venditore, per ciascun oggetto acquistato [5+];</li>
						<li>La possibilità, per i venditori, di rispondere alle recensioni che i clienti lasciano per i propri oggetti [5+];</li>
						<li>Un sistema di georeferenziazione che permette di visualizzare, su una mappa, i negozi che vendono quell’oggetto. [5+]</li>
						<li><b>Il carrello di fine sessione, prima del pagamento, in cui potro’ valutare eventuali cancellazioni di articoli.</b></li>
						<li>La gestione dell’acquisto, attraverso pagina fittizia di pagamento con carta di credito oppure ritiro diretto presso il negozio, per i soli oggetti con tale possibilitàa’ di fruizione: I venditori possono esistere esclusivamente online, oppure avere un negozio fisico con indirizzo classico.. Per questa tipologia di negozio, sarà possibile recuperare la merce direttamente in negozio.</li>
						<li>Un sistema di segnalazione anomalie (es: oggetti non arrivati) che invii al negozio e all’amministratore la richiesta e che poi sia gestita dall’amministratore:
							<ul>
								<li>Segnanlao anomalia e viene recapitata a Negozio + Amministratore.</li>
								<li>L’amministratore decide come gestire: Soldi indietro;
								Segnalazione negativa al venditore;
								Non procedo;
								Rigetto l’anomalia;</li>
							</ul>
						</li>
						<li>L’internazionalizzazione del sito in base alle informazioni ricevute dal browser e/o scelta diretta dell’utente [7] (inteso come localizzazione dei menu e delle informazioni/headers tabelle e bottoni/pulsanti; non devono essere localizzate ovviamente le recensioni e le descrizioni che rimangono nella lingua originale). L’internazionalizzazione è intesa che segua le regole spiegate a lezione o superiori (essendo attivi formalmente uno standard de-facto presentato ed uno standard dell’IANA che codifica le nazioni a due o più lettere).</li>
					</ul>
				</p>
		</div>
		<br>
		<div>
			<h3>OGGETTI ESSENZIALI</h3>
			<h4>Negozio</h4>
			<p>
				<ul>
					<li>Nome</li>
					<li>Descrizione</li>
					<li>Fotografie pubblicate dal proprietario</li>
					<li>Link al sito ufficiale del negozio</li>
					<li>Coordinate Geografiche (città, indirizzo, ecc)</li>
					<li>Orari d' apertura; Tipologia di spedizione; (Per quelli che permettono il ritiro dal negozio)</li>
					<li>Valutazione totale del venditore (da 0 a 5) (valutazione globale dei voti dati al venditore, tipo ebay)</li>
				</ul>
			</p>
			<br/>
			<h4>Oggetti in vendita</h4>
			<p>Gli oggetti devono essere classificati almeno da:
				<ul>
					<li>Nome</li>
					<li>Categoria</li>
					<li>Descrizione</li>
					<li>Fotografie dell'oggetto (una, o più [5+] )</li>
					<li>Review dell'oggetto venduto [... da completare?!?!]</li>
					<li>Negozio che lo vende</li>
				</ul>
			</p>
			<br>
			<h4>Utenti</h4>
			<p>Gli utenti saranno classificati almeno da:
				<ul>
					<li>Nome</li>
					<li>Cognome</li>
					<li>Email</li>
					<li>Password</li>
					<li>Avatar[7+]</li>
				</ul>
			</p>
		</div>
		<br>
		<div>
			<h3>Utenti</h3>
			<p>
			Il portale dovrà prevedere quattro tipologie di utenti:
				<ol>
					<li>Utente Anonimo</li>
					<li>Utente Registrato</li>
					<li>Utente Venditore</li>
					<li>Utente Amministratore</li>
				</ol>
			</p>
			<h4>Utente Anonimo</h4>
			<p>
			Tale utente è quello che accede al sito senza fare login all’interno dello stesso. Tale utente può eseguire le ricerche (come già descritte in SCOPO). L’utente anonimo potrà registrarsi al portale via FORM di registrazione. L’utente anonimo può creare un carrello provvisorio ma non può comperare fino a quando avrà fatto login (o si sia registrato e poi fatto login).
			</p>
			<h4>Utente Registrato</h4>
			<p>
			Tale utente è quello che ha fatto login al sito. L’utente registrato è quello che esegue la maggior parte delle iterazioni con il portale web. Oltre a poter svolgere le attività dell’utente anonimo potrà: comperare, fare recensioni di oggetti e negozi, fare segnalazioni di anomalia. <br/>
			[Modificare/immettere il proprio avatar che deve essere visualizzato nelle recensioni 7+]
			</p>
			<h4>Utente Venditore</h4>
			<p>
			Tale utente potrà: rispondere alle recensioni degli utenti registrati; modificare i dati relativi al proprio business; Inserire nuovi oggetti da vendere [5+ ?Perchè non lo facciamo anche noi?]. Inoltre, potrà eseguire tutte le attività di un utente registrato.
			</p>
			<h4>Utente Amministratore</h4>
			<p>Tale utente è il gestore del sito web e si occupa di gestire le iterazioni tra utenti registrati e utenti venditori in caso di anomalie. Tale utente gestisce le anomalie (vedi sopra); verrà notificato della richiesta di rimborso di un oggetto per cui dovrà valutarne la validità e, quindi, autorizzare il rimborso. Dovrà, quindi, notificare il venditore e decidere se penalizzarne la reputazione.
			</p>
		</div>
		<br>
		<div>
			<h3>Use Case</h3>
			<p>Riferito all' intera applicazionedeve essere congruente a quanto richiesto (in base al numero di persone)</p>
			<h4>Menù principale</h4>
			<p>Ogni pagina del portale dovrà avere lo stesso menu principale personalizzato per tipologia di utente.</p>
			<p>L’<b>utente anonimo</b> avrà accesso al seguente menu principale:
				<ul>
					<li>Pulsante “Registrati”: che lo farà accedere alla form di registrazione;
					</li>
					<li>Pulsante “Accedi”: che lo farà accedere alla form di login;
					</li>
					<li>Pulsante “Lingua”: che gli permetterà di modificare l’internazionalizzazione del portale[7+].(dovranno essere presenti almeno due lingue ed un locale di default. Attenzione a fare una traduzione di tutte le keywords (come spiegato a lezione con Google Translator) in modo che sia evidente all’utilizzatore la lingua scelta e non di solo alcune).
					</li>
				</ul>
			</p>
			<p>L’<b>utente registrato</b> avrà accesso al seguente menu principale:
				<ul>
					<li>Pulsante “Nome e Cognome”:
						<ul>
							<li>Profilo: che permetterà di modificare i dati di profilo dell’utente;
							</li>
							<li>Chiedere rimborso oggetto/segnalare anomalia: che permette di chiedere il rimborso di un oggetto da comprato;
							</li>
							<li>Esci: che permetterà di fare logout dell’utente.
							</li>
						</ul>
					</li>
					<li>Pulsante “Lingua”: che gli permetterà di modificare l’internazionalizzazione del portale [7+]
					</li>
				</ul>
			</p>
			<p>L’utente venditore avrà accesso al seguente menu principale:
				<ul>
					<li>Pulsante “Notifiche”: visualizzerà l’elenco delle ultime notifiche ricevute più un pulsante per accedere a tutte le notifiche;</li>
					<li>Pulsante “Nome e Cognome”:
						<ul>
							<li>Profilo: che permetterà di modificare i dati di profilo dell’utente;</li>
							<li>Il vostro negozio: che permetterà di accedere alla pagina di gestione del proprio negozio;</li>
							<li>Esci: che permetterà di fare logout dell’utente.</li>
							<li>Sistema di aggiunta/cancellazione oggetti in vendita [5+]</li>
						</ul>
					</li>
					<li>Pulsante “Lingua”: che gli permetterà di modificare l’internazionalizzazione del portale.</li>
				</ul>
			</p>
			<p>
				L’<b>utente amministratore</b> avrà accesso al seguente menu principale:
				<ul>
					<li>Pulsante “Notifiche”: visualizzerà l’elenco delle ultime notifiche ricevute più un pulsante per accedere a tutte le notifiche e gestione delle controversie (da spiegare meglio)</li>
					<li>Pulsante “Nome e Cognome”;
						<ul>
							<li>Profilo: che permetterà di modificare i dati di profilo dell’utente;</li>
							<li>Esci: che permetterà di fare logout dell’utente.</li>
						</ul>

					</li>
					<li>Pulsante “Lingua”: che gli permetterà di modificare l’internazionalizzazione del portale.</li>
				</ul>
			</p>
			<h4>Landing Page</h4>
			<p>
			Ogni tipologia di utente avrà accesso alla landing page del portale web che sarà composto da:
				<ul>
					<li>Form di ricerca:
						<ul>
							<li> Text field con auto-completamento: che permetterà di inserire le parole da utilizzare per la ricerca degli oggetti/venditori;</li>
							<li>Pulsante “Cerca”: che avvierà la ricerca.</li>
						</ul>
					</li>
					<li> Elenco di possibili filtri:
						<ul>
							<li>Filtro per vicinanza (solo per oggetti con ritiro)</li>
							<li>Filtro per prezzo</li>
							<li>Filstro per review</li>
					</ul>
					</li>
				</ul>
			</p>

			<h4>Form di registrazione</h4>
			<p>
			L’utente anonimo avrà accesso a tale form che dovrà permettere la registrazione dell’utente e dovrà prevedere:
				<ul>
					<li>Email: che verrà utilizzato anche come username di login;</li>
					<li>Password: che dovrà avere dei meccanismi di scelta di una password solida;</li>
					<li>L’accettazione (anche non immediata, ma prima della prima connessione) alla normativa sulla privacy da accettare;</li>
					<li>Pulsante “Iscriviti”: che invierà la richiesta d’iscrizione;</li>
					<li>Pulsante “Annulla”: che rimanderà l’utente alla pagina da cui era arrivato.</li>
				</ul>
			L’iscrizione al portale dovrà essere validato attraverso il click di un link inviato per email.
			</p>

			<h4>Form di login</h4>
			<p>
			L’utente anonimo avrà accesso a tale form che dovrà permettere il login dell’utente e dovrà prevedere:
				<ul>
					<li>Username: l’email con cui l’utente si è registrato;</li>
					<li>Password: la password con cui l’utente si è registrato;</li>
					<li>Modalità reset della password se l’utente se l’è dimenticata;</li>
					<li>Pulsante “Accedi”: che effettuerà il login dell’utente e ritornerà alla pagina di provenienza;</li>
					<li>Pulsante “Annulla”: che rimanderà l’utente alla pagina da cui era arrivato.</li>
				</ul>
			</p>
			<h4>Form di ricerca (da vedere se lo stesso di cui alla landing page)</h4>
			<p>
			Ogni tipologia di utente avrà accesso a tale form che dovrà permettere la ricerca di oggetti e dovrà prevedere:
					<ul>
						<li>Text field (uno o più consigliati il meno possibile): verranno inserite le parole da ricercare;</li>
						<li>Pulsante “Cerca”: avvierà la ricerca e rimanderà l’utente alla pagina dei risultati.</li>
					</ul>
			Il campo di ricerca avrà l’auto completamento che aiuterà l’utente nella scelta delle parole da ricercare.
			La ricerca dovrà poter includere almeno: la tipologia di oggetto/oggetto, via/cittàa’/regione.
			</p>
			<h4>Pagina dei risultati</h4>
			<p>
			Ogni tipologia di utente avrà accesso alla pagina dei risultati che dovrà prevedere:
				<ul>
					<li>L’elenco degli oggetti ordinati per prezzo; per ogni oggetto dovrà essere visibile:
						<ul>
							<li>Nome del venditore con link alla pagina del negozio;</li>
							<li>Una foto;</li>
							<li>Il voto totale dell’oggetto (da 1 a 5);</li>
							<li>Il numero di recensioni ricevute;</li>
							<li>Link alla mappa (se serve)</li>
							<li>Prezzo.</li>
						</ul>
					</li>
					<li>
						Possibilità di modificare l’ordinamento della classifica:
							<ul>
								<li>Stelline(review);</li>
								<li>Fascia di prezzo.</li>
							</ul>
					</li>
				</ul>

			</p>

			<h4>Pagina della mappa</h4>
			<p>
			Dovrà visualizzare una mappa di Google centrata sul negozio selezionato [per tutti] e [seguente per 5+] che
			presenti tutti i negozi presenti in zona che vendono lo stesso oggetto.
			</p>

			<h4>Pagina del negozio</h4>
			<p>Questa pagina dovrà avere almeno le seguenti informazioni:
				<ul>
					<li>Nome;</li>
					<li>Valutazione totale;</li>
					<li>Indirizzo;</li>
					<li>Almeno una fotografia;</li>
					<li>Elenco delle ultime recensioni;</li>
				</ul>
			</p>

			<h4>Pagina delle notifiche</h4>
			<p>
			L’utente negoziante visualizzerà, in questa pagina, tutte le notifiche di avvenuta recensione o di anomalie.
			Da ogni notifica potrà accedere, rispettivamente, a:
				<ul>
					<li>
						La pagina di risposta alle recensioni;
					</li>
				</ul>
			L’utente amministratore visualizzerà, in questa pagina, tutte le notifiche di anomalie con il sistema di gestione
			annesso.
			Per ogni notifica potrà:
				<ul>
					<li>
						Rigettarla con motivo;
					</li>
					<li>
						Le decisioni sara\nno notfictenotificate ad entrambi
					</li>
					<li>
						Eventualmente dare giudizio negativo al negozio
					</li>
					<li>
						Gestire la restituzione del credito all’utente (il credito rimane a disposizione dell’utente per nuovi
						acquisti) [7+]
					</li>
				</ul>
			</p>
		</div>
		<br>
		<div>
			<h3>Database e precompilazione</h3>
			<p>Ciascun progetto (gruppo) dovrà presentare il proprio lavoro con un database già popolato per almeno:
				<ul>
					<li>
						Quattro regioni amministrative con almeno ciascuna 5 città differenti (anche in differenti stati se
					volete)
					</li>
					<li>
						Per ciascuna città (vista come area estesa attorno alla città) almeno 10 negozi diversi.
						Per ciascuna città la somma delle recensioni (per il totale dei 10 negozi) dovrà essere di almeno 20.
						Dovranno inoltre essere presenti almeno 4 negozi per città con foto pubblicate da utenti.
					</li>
					<li>
						10 utenti minimo già registrati
					</li>
				</ul>
			</p>
		</div>
		<br>
		<p align="center">*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*</p>

		<div>
			<h3>Hint Vari</h3>
			<p>
				<ul>
					<li>String similarity: https://github.com/tdebatty/java-string-similarity. Si tenga presente che per una ricerca efficiente (i.e. motore di ricerca vengono impiegati algoritmi che pre-memorizzano l’indice scelto e quindi ne fanno una sola comparazione al momento della query).</li>
					<li> Geocoding:<br>
					https://developers.google.com/maps/documentation/geocoding/intro#GeocodingRequests e
					https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/re
					gister + http://www.mapquestapi.com/geocoding/
					Ricordarsi che bisogna pre--memorizzare le coordinate geografiche o box per poi fare la ricerca su
					numeri.</li>
					<li>Riempite il database con dati plausibili, evitate nomi tipo ‘negozio1 negozio2’ ecc... cercate di rendere
					presentabile e credibile l’implementazione (in totale: 2*5* 20 recensioni, suggerimenti per
					recuperare recensioni/ ricerca: ebay, http://global.rakuten.com/en/,
					http://www.fromjapan.co.jp/en/</li>
				</ul>
			</p>
		</div>

		<div>
			<h3>Raccomandazioni</h3>
			<p>
				Il sito deve essere progettato in modalità responsive e dimostrato funzionante per risoluzioni pc/tablet/telefono attraverso il device o la modalità relativa sul browser.
				Il progetto dovrà essere mostrato con un database minimo credibile ed intelligentemente popolato per quanto richiesto e nel numero di voci richieste nel presente testo come minimo.</p>
		</div>

		<div>
			<h3>Documentazione</h3>
			<p>Dovrà essere presentata una documentazione del progetto illustrante le caratteristiche e le scelte effettuate</p>
		</div>

		<div>
			<h3>Ricordarsi che per una buona valutazione:</h3>
			<ul>
				<li>all'esame servono due browser per dimostrare le funzionalità</li>
				<li>gli uri di tutti i file devono essere relativi e non assoluti sul file system</li>
				<li>La documentazione presentata deve essere efficace</li>
				<li>Attenzione a chi userà javascript: devono sapere sostenere le scelte implementative *tutti i componenti del gruppo, e non deve violare o rendere inutile il paradigma MVC</li>
				<li>Il database con cui implementare il progetto è a libera scelta (postgres/mysql/derby/ ectc...), ricordandosi che nella consegna dovrà essere data una copia anche del database</li>
			</ul>
		</div>

		<div>
			<h3>Regole di presentazione e consegna progetto</h3>
			<p>
				Consegna progetto 2 giorni prima del giorno dell’appello in cui vorrete sostenere
				l’esame, da un solo componente del gruppo con chiara indicazione dei partecipanti al gruppo. Consegna
				progetto elettronica tramite link a strumento di archiviazione cloud a vostra scelta.
				Dare un NICKNAME al progetto in modo che sia identificabile facilmente rispetto agli altri
				L’esame prevede che:
					<ul>
						<li>Sia Presentato il progetto come sopra</li>
						<li>Il giorno dell’esame si faràa’ l’appello e stabilito l’ordine di presentazione. Eventuali problemi di
						orario saranno da concordare (anche in anticipo) via mail nel rispetto dei reciproci impegni e delle
						liste di partecipanti all’esame</li>
						<li>Dovrà quindi essere effettuata una presentazione del progetto, da tutti i componenti, che
						spiegheranno (il relatore del progetto può essere uno o più degli appartenenti al progetto), la
						filosofia di implementnazione e dimostreranno le funzionalità.</li>
						<li>Verranno fatte domande sulle funzionalitàa’ o sulle scelte implementative e potràa’ rispondere
						chiunque del gruppo.</li>
					</ul>
				Se , per qualche motivo, il gruppo non fosse tutto presente, i componenti mancanti dovranno sostenere l’esame come se il resto del non gruppo esistesse, e dovranno dimostrare padronanza di tutto quanto presentato.</p>
		</div>
		<br/>
	</body>
</html>
