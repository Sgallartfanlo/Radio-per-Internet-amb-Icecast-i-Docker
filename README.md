---

# 🎙️ Projecte Ràdio per Internet amb Icecast i Docker

Aquest projecte permet desplegar un servidor de streaming d'àudio personalitzat utilitzant **Icecast** com a servidor de mitjans i **FFmpeg** com a font d'emissió, tot orquestrat amb **Docker Compose**.

## 📋 Requisits Previs

Abans de començar, assegura't de tenir instal·lat:

* **Docker Desktop** o **Docker Engine**.


* **Docker Compose**.


* Fitxers d'àudio en format **MP3** dins la carpeta `audio/`.



## 🚀 Instal·lació i Posada en Marxa

### 1. Preparació de l'estructura

Clona el repositori o crea l'estructura de directoris següent:

```bash
mkdir -p config audio logs

```

### 2. Configuració Personalitzada

* **Icecast**: Edita el fitxer `config/icecast.xml`. És **obligatori** substituir totes les aparicions de `NOMCOGNOM` pel teu nom i cognom real per personalitzar el servidor, els punts de muntatge i les contrasenyes.


* **Docker Compose**: Revisa el fitxer `docker-compose.yml`. Assegura't que les rutes dels volums i les credencials coincideixen amb la teva configuració d'Icecast.



### 3. Desplegament

Aixeca els contenidors en segon pla des de l'arrel del projecte:

```bash
docker-compose up -d

```

Verifica que els serveis estan actius:

```bash
docker-compose ps

```

## 🎧 Com escoltar la ràdio?

Un cop els contenidors estiguin en estat `Up`, pots accedir a l'emissió de diverses maneres:

* **Interfície Web**: Accedeix a `http://localhost:8000` per veure l'estat del servidor i els punts de muntatge.


* **Reproducció Directa**: Utilitza l'URL del teu punt de muntatge (ex: `http://localhost:8000/radio-NOMCOGNOM.mp3`) al navegador o a un reproductor com **VLC**.


* **Administració**: Gestiona les fonts i oients a `http://localhost:8000/admin/` amb l'usuari `admin`.

## 📊 Punts de Muntatge Configurats

El projecte inclou suport per a diferents qualitats i formats:

1. **Estàndard**: MP3 a 128 kbps.
2. **Alta Qualitat (HQ)**: MP3 a 320 kbps.
3. **Mòbil/Eficient**: Format Opus a 96 kbps.

## 🛠️ Resolució de Problemes

* **Port ocupat**: Si el port 8000 està en ús, pots canviar-lo al `docker-compose.yml` (ex: `"8001:8000"`).
* **Error d'autenticació**: Revisa que la `source-password` al fitxer `icecast.xml` sigui idèntica a la definida a la comanda del streamer al `docker-compose.yml`.


* **Logs en temps real**: Per veure què està passant internament, executa:

```bash
docker-compose logs -f

```



---

**Autor:** Sergi Gallart Fanlo **Assignatura:** Serveis de Xarxa i Internet 

---
