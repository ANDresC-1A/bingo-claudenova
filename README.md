# 🎱 Bingo ClaudeNova

<p align="center">
  <img src="IMAGEN1.png" alt="Bingo ClaudeNova" width="850">
</p>

<h3 align="center">🎮 Plataforma web de Bingo multijugador en tiempo real</h3>

<p align="center">
  Aplicación desarrollada con Django y Django Channels para gestionar partidas de Bingo,
  jugadores y comunicación en tiempo real mediante WebSockets.
</p>

---

## 📌 Descripción

**Bingo ClaudeNova** es una aplicación web de Bingo diseñada para permitir que varios jugadores participen en una misma partida mientras reciben las actualizaciones del juego en tiempo real.

El proyecto cuenta con:

- 🔐 Sistema de inicio de sesión y registro.
- ⏳ Sala de espera.
- 🎱 Cartones de Bingo de 75 bolas.
- 🎲 Sorteo de balotas en tiempo real.
- 💬 Chat entre jugadores.
- 🏆 Validación de BINGO.
- 🔄 Reinicio de partidas desde el panel administrativo.
- 👑 Panel de administración para controlar la partida.
- ⚡ Comunicación en tiempo real mediante WebSockets.

---

## 🖥️ Interfaz del proyecto

### 🔐 Inicio de sesión

<p align="center">
  <img src="capturas/login.png" alt="Pantalla de inicio de sesión" width="850">
</p>

La aplicación cuenta con una pantalla de acceso donde el usuario puede ingresar sus credenciales y acceder al juego.

---

### ⏳ Sala de espera

<p align="center">
  <img src="capturas/sala-espera.png" alt="Sala de espera" width="850">
</p>

La sala de espera permite al jugador esperar el inicio de la partida y visualizar información relacionada con la sala y los jugadores conectados.

---

### 🎱 Partida de Bingo

<p align="center">
  <img src="capturas/juego.png" alt="Partida de Bingo" width="850">
</p>

Durante la partida, cada jugador dispone de un cartón de Bingo generado para la partida.

El sistema utiliza cartones de **5 × 5** para Bingo de 75 bolas, con una casilla central gratuita.

El jugador puede marcar las casillas de su cartón y utilizar la opción **BINGO** cuando considere que tiene un patrón ganador.

---

### 👑 Panel de administración

<p align="center">
  <img src="capturas/panel-admin.png" alt="Panel de administración" width="850">
</p>

El administrador dispone de un panel para controlar la partida.

Desde este panel se pueden realizar acciones como:

- 🎱 Sortear una nueva balota.
- 🔄 Reiniciar la partida.
- 👀 Controlar el estado de la partida.

Cuando se sortea una balota, el resultado se comunica a los jugadores conectados mediante WebSockets.

---

## ⚡ Comunicación en tiempo real

El proyecto utiliza **Django Channels** y **WebSockets** para enviar eventos a los jugadores conectados.

Entre los eventos utilizados se encuentran:

```text
new_ball
chat_message
bingo_claim
game_over
game_reset
```

Esto permite que las acciones realizadas durante la partida se reflejen en los clientes conectados sin necesidad de actualizar manualmente la página.

---

## 🏗️ Arquitectura del proyecto

```text
bingoclaudenova/
│
├── editor/
│   ├── migrations/
│   ├── static/
│   │   ├── css/
│   │   ├── js/
│   │   └── imagenes/
│   │
│   ├── templates/
│   │   └── editor/
│   │       ├── login.html
│   │       ├── register.html
│   │       ├── sala_espera.html
│   │       ├── juego.html
│   │       └── admin_panel.html
│   │
│   ├── admin.py
│   ├── apps.py
│   ├── consumers.py
│   ├── models.py
│   ├── routing.py
│   ├── services.py
│   ├── urls.py
│   └── views.py
│
├── proyecto/
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
│
├── db.sqlite3
├── manage.py
├── requirements.txt
├── setup_usuarios_prueba.py
└── startup.sh
```

---

## 🧩 Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| 🐍 Python | Lenguaje principal |
| 🌐 Django | Framework web |
| ⚡ Django Channels | Comunicación WebSocket |
| 🔌 Daphne | Servidor ASGI |
| 🗄️ SQLite | Base de datos utilizada en el proyecto |
| 🎨 HTML / CSS | Interfaz de usuario |
| 📜 JavaScript | Interactividad y comunicación WebSocket |

---

## 🎯 Funcionamiento general

```text
                 ┌──────────────────────┐
                 │       USUARIO        │
                 │      Login / Registro│
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │    SALA DE ESPERA    │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │   PARTIDA DE BINGO   │
                 │                      │
                 │  🎱 Cartón           │
                 │  💬 Chat             │
                 │  🏆 BINGO            │
                 └──────────┬───────────┘
                            │
                 WebSocket │
                            ▼
                 ┌──────────────────────┐
                 │   SERVIDOR DJANGO    │
                 │      CHANNELS        │
                 └──────────┬───────────┘
                            ▲
                            │
                 ┌──────────┴───────────┐
                 │  PANEL ADMINISTRADOR │
                 │                      │
                 │ 🎱 Sortear balota    │
                 │ 🔄 Reiniciar juego   │
                 └──────────────────────┘
```

---

## 🎱 Lógica del Bingo

El proyecto utiliza Bingo de **75 bolas** dividido en las columnas:

```text
B → 1 - 15
I → 16 - 30
N → 31 - 45
G → 46 - 60
O → 61 - 75
```

Los cartones se generan como una matriz de **5 × 5** y la posición central corresponde a una casilla gratuita.

La validación de BINGO contempla:

- Líneas horizontales.
- Líneas verticales.
- Diagonales.

---

## 👥 Usuarios de prueba

El proyecto incluye un script para crear usuarios y datos de prueba:

```bash
python setup_usuarios_prueba.py
```

Usuarios incluidos:

| Usuario | Contraseña |
|---|---|
| `alice` | `alice123` |
| `bob` | `bob123` |
| `charlie` | `charlie123` |

> Estas credenciales corresponden al entorno de prueba local.

---

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd bingoclaudenova
```

### 2. Crear el entorno virtual

En Windows:

```powershell
py -3.14 -m venv venv
```

Activarlo:

```powershell
.\venv\Scripts\Activate.ps1
```

### 3. Instalar dependencias

```powershell
pip install -r requirements.txt
```

### 4. Ejecutar migraciones

```powershell
python manage.py migrate
```

### 5. Crear datos de prueba

```powershell
python setup_usuarios_prueba.py
```

### 6. Ejecutar el servidor

```powershell
python manage.py runserver
```

Abrir en el navegador:

```text
http://127.0.0.1:8000/
```

---

## 👑 Acceso al panel de administración

Para crear un usuario administrador:

```powershell
python manage.py createsuperuser
```

Después de iniciar sesión, el panel del proyecto está disponible en:

```text
http://127.0.0.1:8000/panel/
```

El usuario debe tener permisos de administrador (`is_staff`) para acceder al panel.

---

## 🔌 Rutas WebSocket

El proyecto utiliza actualmente las siguientes rutas:

```text
/ws/sala/
/ws/juego/
```

Estas conexiones permiten mantener la comunicación en tiempo real entre el servidor y los jugadores.

---

## 📁 Componentes principales

### `models.py`

Contiene los modelos principales:

- `Sala`
- `Partida`
- `Carton`

### `views.py`

Gestiona:

- Registro.
- Inicio de sesión.
- Sala de espera.
- Partida.
- Panel administrativo.
- Sorteo de balotas.
- Reinicio de partida.

### `consumers.py`

Gestiona las conexiones WebSocket y eventos en tiempo real.

### `services.py`

Contiene servicios relacionados con:

- Generación de cartones.
- Sorteo de balotas.
- Validación de BINGO.
- Programación de partidas.

### `routing.py`

Define las rutas WebSocket utilizadas por Django Channels.

---

## 🛠️ Comandos útiles

### Comprobar configuración

```powershell
python manage.py check
```

### Ejecutar migraciones

```powershell
python manage.py migrate
```

### Crear migraciones

```powershell
python manage.py makemigrations
```

### Recopilar archivos estáticos

```powershell
python manage.py collectstatic --noinput
```

### Ejecutar servidor

```powershell
python manage.py runserver
```

### Detener servidor

```text
CTRL + C
```

---

## 📸 Capturas del proyecto

Se recomienda mantener las capturas del README organizadas así:

```text
capturas/
├── login.png
├── sala-espera.png
├── juego.png
└── panel-admin.png
```

---

## 👨‍💻 Autor

**Andres Contreras** **wilmer flores**


---

## 📄 Licencia

Este proyecto se encuentra destinado a fines académicos y de desarrollo.
