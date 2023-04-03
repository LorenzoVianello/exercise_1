<div align="center">
  Progetto Test Flutter <b>exercise_1</b>
</div>

<br />
<hr />
<br />

- [Scopo](#scopo)
    - [Richieste di progetto]("#richieste)
- [Ambiente di sviluppo](#richieste-di-sviluppo)
    - [Linguaggi](#linguaggi)
    - [Packages](#packages)
- [Commenti al codice](#commenti-al-codice)
    - [Login e Logout](#login-e-logout)
    - [Fetch dei dati](#fetch-dei-dati)
    - [Grafica](#fgrafica)


---

## Scopo
<br/>


Generare un applicazione, tramite Flutter, in grado di gestire login, logout, fetch di dati e loro graficizzazione, tramite lista e nel dettaglio dei singoli elementi

---
<br/>

## Ambiente di sviluppo
<br/>


L'ambiente di sviluppo comprende due linguaggi: Flutter e Dart, con i relativi packages

<br/>

### Linguaggi

- Flutter: Utilizzata la versione 3.7.8
- Dart: Utilizzata la versione 2.19.5

<br/>

### Packages
<br/>


All'interno del progetto sono stati utilizzati 4 packages:

- Dio: Dart I/O, fornisce una gestione delle richieste web più performante e dettagliata di flutter http

- Get: Fornisce a Flutter uno state management migliore di setState, routes dinamiche, gestione UI, tool CLI etc.

- Sizer: Tramite un wrapper globale fornisce alla grafica la possibilità di adattarsi tramite altezza, larghezza e rapporto altezza/larghezza, senza dover lavorare con delle dimensioni statiche, evitando di adeguare ogni grafica alle diverse dimensioni degli schermi

- Lint: Il suo utilizzo in sviluppo fornisce regole lint per evitare l'utilizzo di alcune practise del linguaggi flutter (es. dichiarazione di Widget const)

---
<br/>

## Commenti al codice
<br/>

### Login e Logout
<br/>

Il login è gestito tramite pagina grafica e controller di login.
Il controller fornisce i TextEditingController che gestiscono l'input dell'utente, il metodo di login, logout e controllo del popolamento dei campi username e password.
Se il login è effettuato correttamente, l'utente sarà reindirizzato alla pagina degli elementi, che saranno popolati di conseguenza.
Il logout viene gestito alla pressione del pulsante logout nella pagina degli elementi, e riporta all pagina di login, cancellando il token d'accesso.

NB
Il fetch dei dati ed il login non richiede username, passworde nè l'utilizzo di alcun token d'accesso. Viene solo ed esclusivamente utilizzata una funzione di login per controllare che i campi username e password non siano vuoti.

<br/>

## Fetch dei dati
<br/>

Il fetch dei dati viene eseguito a login avvenuto, tramite ascolto di variabile booleana sottoforma di stream osservabile. A login avvenuto una funzione di popolamento si occupa di effettuare una richiesta http, trasformare i dati in JSON e popolare una lista sula base dell'interpretazione dei dati stessi.


<br/>

## Grafica
<br/>

La grafica dell'applicazione è stata progettata per l'utilizzo mobile, verticale, utilizzando un emulatore ed un dispositivo smartphone Android.
Sono stati utilizzati Widget STOCK di Flutter, con grafica material3, inclusa su Flutter dalla versione 3.
Una versione demo dell'applicazione può essere trovata all'interno della cartella OUTPUTS, con il nome app-release.apk



