 <div align="center">

# 💈 BarberApp

### Sistema web de gestión de citas para barberías

**Proyecto Intermodular · Desarrollo de Aplicaciones Multiplataforma (DAM)**

![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

**Estado:** 🚧 En desarrollo

</div>

---

## 📖 Descripción

**BarberApp** es una aplicación web diseñada para facilitar la gestión de citas de una barbería, ofreciendo una alternativa a las reservas realizadas mediante llamadas o mensajes.

El proyecto se desarrolla para el módulo de **Proyecto Intermodular**, perteneciente al **Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM)**.

La aplicación permitirá que los clientes reserven y consulten sus citas de forma sencilla, mientras que el barbero podrá organizar su agenda y gestionar su disponibilidad.

## ✨ Funcionalidades previstas

| 👤 Clientes | ✂️ Barbero |
|---|---|
| Registro e inicio de sesión | Consulta y gestión de la agenda |
| Consulta de servicios | Configuración de horarios |
| Consulta de disponibilidad | Bloqueo de fechas y horas |
| Reserva de citas | Gestión de servicios |
| Consulta de próximas citas e historial | Gestión de reservas |
| Cancelación de citas | |

> Las funcionalidades se implementarán progresivamente. Algunas, como la cancelación de citas, podrán incorporarse en fases posteriores.

## 🛠️ Tecnologías

| Componente | Tecnología |
|---|---|
| Backend | Java 21 · Spring Boot |
| Frontend | HTML5 · CSS3 · JavaScript |
| Base de datos | MySQL |
| Gestión de dependencias | Maven |
| Entorno de desarrollo | IntelliJ IDEA |
| Control de versiones | Git · GitHub |
| Comunicación | HTTP · API REST |

## 🏗️ Arquitectura

La aplicación seguirá una arquitectura cliente-servidor:

```text
┌─────────────────────────────┐
│          FRONTEND           │
│    HTML · CSS · JavaScript  │
└──────────────┬──────────────┘
               │
         Peticiones HTTP
               │
┌──────────────▼──────────────┐
│           BACKEND           │
│      Java · Spring Boot     │
│           API REST          │
└──────────────┬──────────────┘
               │
          Acceso a datos
               │
┌──────────────▼──────────────┐
│       BASE DE DATOS         │
│            MySQL            │
└─────────────────────────────┘
```

El backend gestionará las reglas de negocio, como la disponibilidad de horarios, el registro de reservas y el control de acceso de los usuarios.

## 📊 Estado del proyecto

El desarrollo está organizado en tareas incrementales.

| Tarea | Descripción | Estado |
|---|---|---|
| T01 | Crear y configurar Spring Boot | ✅ Completada |
| T02 | Crear la base de datos MySQL | ⏳ Pendiente |
| T03 | Configurar la conexión Spring Boot–MySQL | ⏳ Pendiente |
| T04 | Crear y consumir un endpoint REST de prueba | ✅ Completada |
| T05 | Implementar registro e inicio de sesión | ⏳ Pendiente |
| T06 | Gestionar horarios y bloqueos | ⏳ Pendiente |
| T07 | Calcular disponibilidad | ⏳ Pendiente |
| T08 | Implementar reservas | ⏳ Pendiente |
| T09 | Consultar citas de los clientes | ⏳ Pendiente |
| T10 | Desarrollar e integrar las pantallas web | ⏳ Pendiente |

### 🔍 Primera prueba de comunicación

Se ha preparado un endpoint REST para comprobar la comunicación entre el frontend y el backend.

**Endpoint:**

`GET /api/prueba`

**Respuesta:**

```text
Conexión con BarberApp correcta
```

Desde JavaScript se utiliza `fetch()` para realizar la petición y mostrar el texto recibido en la página web.

## 🚀 Instalación y ejecución

### Requisitos

- Java JDK 21.
- IntelliJ IDEA u otro IDE compatible.
- Git.
- Maven Wrapper incluido en el proyecto.

### Pasos

**1. Clonar el repositorio**

```bash
git clone https://github.com/Daviiid07/BarberApp.git
```

**2. Acceder al proyecto**

```bash
cd BarberApp
```

**3. Ejecutar la aplicación**

Desde IntelliJ IDEA, abre el proyecto y ejecuta la clase principal de Spring Boot.

Alternativamente, en Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

**4. Acceder a la aplicación**

Abre el navegador:

`http://localhost:8080/`

Para probar directamente el endpoint:

`http://localhost:8080/api/prueba`

> Actualmente, la aplicación se encuentra en desarrollo. La conexión con MySQL y las funcionalidades de gestión de citas todavía están pendientes de implementación.

## 📁 Estructura inicial

```text
BarberApp/
├── src/
│   ├── main/
│   │   ├── java/com/barberapp/
│   │   │   ├── BarberAppApplication.java
│   │   │   └── controller/
│   │   │       └── PruebaController.java
│   │   └── resources/
│   │       ├── static/
│   │       │   ├── index.html
│   │       │   └── script.js
│   │       └── application.properties
│   └── test/
├── pom.xml
├── mvnw
├── mvnw.cmd
└── README.md
```

## 👨‍💻 Autor

**David Garrido Quiles**

- **Módulo:** Proyecto Intermodular
- **Ciclo formativo:** Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM)
- **Centro educativo:** IES Gregorio Prieto
- **Curso académico:** 2026/2027
---

<div align="center">

**💈 BarberApp — Una forma más sencilla de gestionar las citas de tu barbería.**

*Proyecto académico en desarrollo · 2026/2027*

</div> 