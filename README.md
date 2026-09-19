# 🎱 Bingo ClaudeNova

<p align="center">
  <img src="juego.jpeg" alt="Bingo ClaudeNova" width="850">
</p>

<h3 align="center">🎮 Plataforma web de Bingo multijugador en tiempo real</h3>

<p align="center">
  Aplicación web desarrollada con Django y Django Channels para gestionar
  partidas de Bingo, jugadores, salas y comunicación en tiempo real mediante WebSockets.
</p>

<p align="center">

  <a href="https://github.com/ANDresC-1A/bingo-claudenova">
    <img src="https://img.shields.io/badge/GitHub-Repositorio-181717?style=for-the-badge&logo=github" alt="GitHub">
  </a>

  <img src="https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python">

  <img src="https://img.shields.io/badge/Django-Framework-092E20?style=for-the-badge&logo=django&logoColor=white" alt="Django">

  <img src="https://img.shields.io/badge/WebSockets-Tiempo%20Real-010101?style=for-the-badge" alt="WebSockets">

</p>

---

# 🔗 Repositorio

El código fuente completo del proyecto se encuentra disponible en GitHub:

<p align="center">

<a href="https://github.com/ANDresC-1A/bingo-claudenova">
https://github.com/ANDresC-1A/bingo-claudenova
</a>

</p>

---

# 📌 Descripción

**Bingo ClaudeNova** es una aplicación web de Bingo multijugador desarrollada con **Python, Django y Django Channels**.

El proyecto permite que varios jugadores participen en una misma partida de Bingo mientras reciben las actualizaciones del juego en tiempo real.

La aplicación incorpora un sistema de usuarios, salas de espera, generación de cartones, sorteo de balotas, chat, validación de BINGO y un panel administrativo para controlar las partidas.

La comunicación en tiempo real se realiza mediante **WebSockets**, permitiendo que los eventos del juego se actualicen automáticamente en los navegadores de los jugadores conectados.

---

# ✨ Características principales

- 🔐 Sistema de registro e inicio de sesión.
- 👥 Soporte para múltiples jugadores.
- ⏳ Sala de espera.
- 🎱 Cartones de Bingo de 75 bolas.
- 🎲 Sorteo de balotas.
- ⚡ Actualizaciones en tiempo real.
- 💬 Chat entre jugadores.
- 🏆 Validación de BINGO.
- 🔄 Reinicio de partidas.
- 👑 Panel de administración.
- 📡 Comunicación mediante WebSockets.
- 🧩 Arquitectura basada en Django.
- 🗄️ Persistencia de información mediante base de datos.

---

# 🖥️ Interfaz del proyecto

## 🔐 Inicio de sesión

<p align="center">
  <img src="ini.jpeg" alt="Inicio de sesión de Bingo ClaudeNova" width="850">
</p>

La aplicación cuenta con un sistema de autenticación que permite a los usuarios ingresar mediante sus credenciales.

Desde esta pantalla el usuario puede acceder a la plataforma y posteriormente ingresar a una sala de juego.

---

## ⏳ Sala de espera

<p align="center">
  <img src="sala.jpeg" alt="Sala de espera de Bingo ClaudeNova" width="850">
</p>

La sala de espera permite que los jugadores permanezcan conectados mientras se prepara la partida.

Desde esta sección se gestiona el ingreso de los jugadores antes de comenzar el juego.

---

## 🎱 Partida de Bingo

<p align="center">
  <img src="juego.jpeg" alt="Partida de Bingo ClaudeNova" width="850">
</p>

Durante la partida, cada jugador dispone de un cartón de Bingo generado para el juego.

El sistema utiliza el formato tradicional de **Bingo de 75 bolas**, organizado en cinco columnas:

```text
B → 1 - 15
I → 16 - 30
N → 31 - 45
G → 46 - 60
O → 61 - 75
```

Cada cartón está compuesto por una matriz de:

```text
5 × 5
```

La casilla central corresponde a una casilla gratuita.

Los jugadores pueden marcar las balotas que hayan sido sorteadas y utilizar la opción **BINGO** cuando consideren que han completado un patrón ganador.

---

## 👑 Panel de administración

<p align="center">
  <img src="admin.jpeg" alt="Panel de administración de Bingo ClaudeNova" width="850">
</p>

El sistema cuenta con un panel administrativo desde el cual se puede controlar el desarrollo de las partidas.

Entre las acciones disponibles se encuentran:

- 🎱 Sortear una nueva balota.
- 🔄 Reiniciar la partida.
- 👀 Controlar el estado de la partida.
- 👥 Gestionar el desarrollo del juego.

Cuando el administrador realiza una acción, los jugadores conectados reciben la actualización correspondiente mediante WebSockets.

---

# ⚡ Comunicación en tiempo real

Uno de los componentes principales de **Bingo ClaudeNova** es la comunicación en tiempo real.

Para implementar esta funcionalidad se utilizan:

- **Django Channels**
- **WebSockets**
- **Daphne**
- **ASGI**

Esto permite que las acciones realizadas en una partida sean comunicadas automáticamente a los jugadores conectados sin necesidad de actualizar manualmente la página.

---

# 📡 Eventos WebSocket

El proyecto utiliza diferentes eventos para comunicar información entre el servidor y los clientes.

Algunos de los eventos utilizados son:

```text
new_ball
chat_message
bingo_claim
game_over
game_reset
```

### 🎲 `new_ball`

Se utiliza cuando el administrador realiza el sorteo de una nueva balota.

---

### 💬 `chat_message`

Permite enviar mensajes entre los jugadores conectados a la partida.

---

### 🏆 `bingo_claim`

Se utiliza cuando un jugador reclama que ha conseguido BINGO.

El servidor procesa la solicitud y realiza la validación correspondiente.

---

### 🏁 `game_over`

Indica que la partida ha finalizado.

---

### 🔄 `game_reset`

Permite notificar a los jugadores que la partida ha sido reiniciada.

---

# 🏗️ Arquitectura del sistema

El funcionamiento general de la aplicación puede representarse de la siguiente manera:

```text
                         ┌─────────────────────┐
                         │       USUARIO       │
                         │                     │
                         │  Registro / Login   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │    SALA DE ESPERA   │
                         │                     │
                         │ Jugadores conectados│
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   PARTIDA DE BINGO  │
                         │                     │
                         │ 🎱 Cartón           │
                         │ 🎲 Balotas          │
                         │ 💬 Chat             │
                         │ 🏆 BINGO            │
                         └──────────┬──────────┘
                                    │
                              WebSocket
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   DJANGO CHANNELS   │
                         │                     │
                         │      Consumers      │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       DJANGO        │
                         │                     │
                         │ Models              │
                         │ Views               │
                         │ Services            │
                         │ Routing             │
                         └──────────┬──────────┘
                                    ▲
                                    │
                              WebSocket
                                    │
                         ┌──────────┴──────────┐
                         │   ADMINISTRADOR     │
                         │                     │
                         │ 🎱 Sortear balota   │
                         │ 🔄 Reiniciar juego  │
                         │ 👀 Controlar juego  │
                         └─────────────────────┘
```

---

# 🎯 Funcionamiento general

El funcionamiento de una partida se puede dividir en varias etapas:

```text
1. Registro / Inicio de sesión
              │
              ▼
2. Ingreso a la sala de espera
              │
              ▼
3. Inicio de la partida
              │
              ▼
4. Generación del cartón
              │
              ▼
5. Sorteo de balotas
              │
              ▼
6. Actualización mediante WebSocket
              │
              ▼
7. Jugadores marcan sus cartones
              │
              ▼
8. Jugador reclama BINGO
              │
              ▼
9. Servidor valida el patrón
              │
        ┌─────┴─────┐
        │           │
        ▼           ▼
      Válido      Inválido
        │           │
        ▼           ▼
   🏆 BINGO       Continúa
        │
        ▼
10. Finalización de partida
        │
        ▼
11. Reinicio
```

---

# 🎱 Lógica del Bingo

El proyecto implementa un sistema de **Bingo de 75 bolas**.

Las bolas están distribuidas de acuerdo con las columnas tradicionales:

| Columna | Rango |
|---|---:|
| **B** | 1 - 15 |
| **I** | 16 - 30 |
| **N** | 31 - 45 |
| **G** | 46 - 60 |
| **O** | 61 - 75 |

---

## 🎟️ Cartón

Cada jugador recibe un cartón de:

```text
5 × 5
```

Ejemplo conceptual:

```text
 B    I    N    G    O
────────────────────────
 7   18   34   51   68
12   25   42   57   72
 3   21  FREE  49   65
14   29   37   54   70
 8   16   45   60   63
```

La posición central es una casilla gratuita:

```text
FREE
```

---

# 🏆 Validación de BINGO

El sistema contempla diferentes patrones para determinar un BINGO:

### ➡️ Línea horizontal

```text
X X X X X
```

---

### ⬇️ Línea vertical

```text
X
X
X
X
X
```

---

### ↘️ Diagonal principal

```text
X . . . .
. X . . .
. . X . .
. . . X .
. . . . X
```

---

### ↙️ Diagonal secundaria

```text
. . . . X
. . . X .
. . X . .
. X . . .
X . . . .
```

El servidor se encarga de comprobar las condiciones correspondientes cuando un jugador realiza una reclamación de BINGO.

---

# 👥 Usuarios de prueba

El proyecto incluye un script para crear usuarios y datos de prueba:

```powershell
python setup_usuarios_prueba.py
```

Los usuarios de prueba incluidos son:

| Usuario | Contraseña |
|---|---|
| `alice` | `alice123` |
| `bob` | `bob123` |
| `charlie` | `charlie123` |

> ⚠️ Estas credenciales están destinadas únicamente al entorno de prueba local y no deben utilizarse como credenciales reales en producción.

---

# 🧩 Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| 🐍 **Python** | Lenguaje principal |
| 🌐 **Django** | Framework web |
| ⚡ **Django Channels** | Comunicación en tiempo real |
| 🔌 **Daphne** | Servidor ASGI |
| 🗄️ **SQLite** | Base de datos utilizada |
| 🎨 **HTML5** | Estructura de las interfaces |
| 🎨 **CSS3** | Diseño visual |
| 📜 **JavaScript** | Interactividad |
| 📡 **WebSockets** | Comunicación bidireccional en tiempo real |
| 🔧 **Git** | Control de versiones |
| 🐙 **GitHub** | Repositorio del proyecto |

---

# 📁 Estructura del proyecto

```text
bingoclaudenova/
│
├── .github/
│   └── workflows/
│
├── editor/
│   ├── migrations/
│   │
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
├── .deployment
├── .gitignore
├── db.sqlite3
├── manage.py
├── requirements.txt
├── setup_usuarios_prueba.py
├── startup.sh
│
├── ini.jpeg
├── sala.jpeg
├── juego.jpeg
└── admin.jpeg
```

---

# 📂 Componentes principales

## `models.py`

Contiene los modelos principales utilizados para representar la información del sistema.

Entre ellos:

```text
Sala
Partida
Carton
```

---

## `views.py`

Gestiona las diferentes vistas y operaciones HTTP de la aplicación.

Entre sus responsabilidades:

- Registro.
- Inicio de sesión.
- Sala de espera.
- Partida.
- Panel administrativo.
- Sorteo de balotas.
- Reinicio de partidas.

---

## `consumers.py`

Gestiona las conexiones WebSocket utilizando Django Channels.

Se encarga de procesar los eventos enviados entre los clientes y el servidor.

---

## `services.py`

Contiene la lógica relacionada con el funcionamiento del Bingo.

Entre sus responsabilidades:

- Generación de cartones.
- Sorteo de balotas.
- Validación de BINGO.
- Gestión de partidas.
- Lógica del juego.

---

## `routing.py`

Define las rutas utilizadas para las conexiones WebSocket.

Actualmente se utilizan:

```text
/ws/sala/
/ws/juego/
```

---

## `urls.py`

Define las rutas HTTP de la aplicación Django.

---

## `asgi.py`

Configura la aplicación **ASGI**, necesaria para trabajar con Django Channels y WebSockets.

---

# 🔌 Rutas WebSocket

El proyecto utiliza las siguientes rutas principales:

```text
/ws/sala/
/ws/juego/
```

### Sala

```text
/ws/sala/
```

Gestiona la comunicación relacionada con la sala de espera.

### Juego

```text
/ws/juego/
```

Gestiona la comunicación relacionada con la partida.

---

# 🚀 Instalación

## 1. Clonar el repositorio

```bash
git clone https://github.com/ANDresC-1A/bingo-claudenova.git
```

Entrar al proyecto:

```bash
cd bingo-claudenova
```

---

## 2. Crear el entorno virtual

En Windows:

```powershell
py -3.14 -m venv venv
```

---

## 3. Activar el entorno virtual

En PowerShell:

```powershell
.\venv\Scripts\Activate.ps1
```

Si aparece un error relacionado con la política de ejecución de PowerShell, se puede ejecutar:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Después:

```powershell
.\venv\Scripts\Activate.ps1
```

---

## 4. Instalar las dependencias

Con el entorno virtual activado:

```powershell
pip install -r requirements.txt
```

---

## 5. Ejecutar las migraciones

```powershell
python manage.py migrate
```

---

## 6. Crear usuarios de prueba

```powershell
python setup_usuarios_prueba.py
```

---

## 7. Ejecutar el servidor

```powershell
python manage.py runserver
```

La aplicación estará disponible en:

```text
http://127.0.0.1:8000/
```

---

# 👑 Panel administrativo

Para crear un usuario administrador de Django:

```powershell
python manage.py createsuperuser
```

Después de crear el usuario, se puede acceder al panel administrativo de Django:

```text
http://127.0.0.1:8000/admin/
```

El panel administrativo del proyecto se encuentra en:

```text
http://127.0.0.1:8000/panel/
```

El usuario debe contar con los permisos necesarios para acceder al panel.

---

# 🛠️ Comandos útiles

### Comprobar configuración

```powershell
python manage.py check
```

### Crear migraciones

```powershell
python manage.py makemigrations
```

### Ejecutar migraciones

```powershell
python manage.py migrate
```

### Crear superusuario

```powershell
python manage.py createsuperuser
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

# 🌐 Despliegue

El proyecto incluye archivos relacionados con el despliegue:

```text
.deployment
startup.sh
```

El archivo:

```text
startup.sh
```

contiene las instrucciones necesarias para iniciar la aplicación en un entorno compatible.

Debido al uso de **Django Channels y WebSockets**, el proyecto requiere un servidor compatible con **ASGI**.

En producción se puede utilizar un servidor como **Daphne**.

---

# 🔒 Consideraciones de seguridad

Para utilizar el proyecto en un entorno de producción se recomienda:

- 🔑 Utilizar una `SECRET_KEY` segura.
- 🚫 No publicar contraseñas reales.
- 🔐 Configurar `DEBUG=False`.
- 🌐 Configurar correctamente `ALLOWED_HOSTS`.
- 🔒 Utilizar HTTPS.
- 🔑 Utilizar variables de entorno para información sensible.
- 🗄️ Utilizar una base de datos adecuada para producción.
- 🛡️ Configurar correctamente los permisos de usuarios.
- 🚫 No utilizar las credenciales de prueba en producción.

---

# 📸 Capturas del proyecto

Las imágenes utilizadas en este README se encuentran directamente en la raíz del repositorio:

```text
bingoclaudenova/
│
├── ini.jpeg
├── sala.jpeg
├── juego.jpeg
└── admin.jpeg
```

| Archivo | Descripción |
|---|---|
| `ini.jpeg` | 🔐 Pantalla de inicio de sesión |
| `sala.jpeg` | ⏳ Sala de espera |
| `juego.jpeg` | 🎱 Partida de Bingo |
| `admin.jpeg` | 👑 Panel administrativo |

---

# 🎓 Objetivo del proyecto

**Bingo ClaudeNova** fue desarrollado como un proyecto académico y práctico con el objetivo de aplicar diferentes conceptos relacionados con el desarrollo de aplicaciones web.

Entre los principales objetivos se encuentran:

- Desarrollar una aplicación web utilizando Django.
- Implementar autenticación de usuarios.
- Crear una aplicación multijugador.
- Implementar comunicación en tiempo real.
- Utilizar WebSockets.
- Trabajar con Django Channels.
- Gestionar información mediante una base de datos.
- Implementar lógica de un juego de Bingo.
- Desarrollar interfaces web.
- Aplicar una arquitectura cliente-servidor.
- Utilizar Git y GitHub para el control de versiones.

---

# 📚 Conceptos aplicados

Durante el desarrollo del proyecto se aplicaron conceptos relacionados con:

```text
Python
   │
   ├── Django
   │
   ├── Django Channels
   │
   ├── WebSockets
   │
   ├── ASGI
   │
   ├── Bases de datos
   │
   ├── Autenticación
   │
   ├── Programación orientada a objetos
   │
   └── Desarrollo web
```

---

# 🚀 Posibles mejoras futuras

El proyecto puede continuar evolucionando mediante la incorporación de nuevas funcionalidades.

Algunas posibles mejoras son:

- 👥 Sistema avanzado de creación de salas.
- 🏆 Historial de ganadores.
- 📊 Estadísticas de jugadores.
- 🏅 Sistema de ranking.
- 🎨 Personalización de cartones.
- 🔊 Efectos de sonido.
- 📱 Diseño responsive mejorado.
- 👤 Perfil de usuario.
- 🔐 Recuperación de contraseña.
- 📈 Panel de estadísticas administrativas.
- 🌐 Utilización de una base de datos para producción.
- 🔔 Sistema de notificaciones.
- 🎮 Diferentes modalidades de Bingo.

---

# 📄 Licencia

Este proyecto fue desarrollado con fines **académicos y educativos**.

El código forma parte del proyecto **Bingo ClaudeNova**.

---

# 👨‍💻 Autores

<p align="center">

<strong>Andres Contreras</strong>

<br>

<strong>Wilmer Flores</strong>

</p>

---

# 🔗 Enlaces

### 📦 Repositorio

<p align="center">
<a href="https://github.com/ANDresC-1A/bingo-claudenova">
  https://github.com/ANDresC-1A/bingo-claudenova
</a>
</p>

---

<p align="center">

🎱 <strong>Bingo ClaudeNova</strong> 🎱

<br>

Plataforma web de Bingo multijugador en tiempo real.

<br><br>

Desarrollado con ❤️ usando Python, Django y Django Channels.

</p>
