# BarberApp

Aplicación web para la gestión de citas y reservas de una barbería, desarrollada para el módulo de **Proyecto Intermodular** del Ciclo Formativo de Grado Superior de **Desarrollo de Aplicaciones Multiplataforma (DAM)**.

## Descripción

BarberApp tiene como objetivo facilitar la gestión de las citas de una barbería, sustituyendo los métodos tradicionales de reserva mediante mensajes o llamadas por una aplicación web.

Los clientes podrán consultar la disponibilidad de horarios, reservar citas y consultar sus reservas. Por otro lado, el barbero podrá gestionar su agenda, establecer sus horarios de trabajo y bloquear determinados periodos.

## Tecnologías utilizadas

- **Backend:** Java 21 y Spring Boot.
- **Frontend:** HTML, CSS y JavaScript.
- **Base de datos:** MySQL.
- **Gestión de dependencias:** Maven.
- **Entorno de desarrollo:** IntelliJ IDEA.
- **Control de versiones:** Git y GitHub.

## Funcionalidades previstas

### Cliente

- Registro e inicio de sesión.
- Consulta de servicios disponibles.
- Consulta de fechas y horarios libres.
- Reserva de citas.
- Consulta de próximas citas e historial de reservas.
- Cancelación de citas, según las condiciones establecidas.

### Barbero

- Consulta y gestión de la agenda.
- Configuración de horarios de trabajo.
- Bloqueo de fechas y franjas horarias.
- Gestión de los servicios ofrecidos.

## Arquitectura

La aplicación seguirá una arquitectura cliente-servidor:

- **Frontend:** interfaz web desarrollada con HTML, CSS y JavaScript.
- **Backend:** API REST desarrollada con Spring Boot, encargada de procesar las peticiones y aplicar las reglas de negocio.
- **Base de datos:** MySQL, utilizada para almacenar usuarios, servicios, citas y horarios.

La comunicación entre el frontend y el backend se realizará mediante peticiones HTTP y respuestas JSON.

## Estado del desarrollo

El proyecto se encuentra en su fase inicial de implementación.

### Completado

- [x] T01 — Crear y configurar el proyecto Spring Boot.

### Pendiente

- [ ] T02 — Crear la base de datos MySQL.
- [ ] T03 — Configurar la conexión entre Spring Boot y MySQL.
- [ ] T04 — Crear un endpoint REST de prueba.
- [ ] T05 — Implementar el registro e inicio de sesión.
- [ ] T06 — Implementar la gestión de horarios y bloqueos.
- [ ] T07 — Implementar el cálculo de disponibilidad.
- [ ] T08 — Implementar la creación de reservas.
- [ ] T09 — Implementar la consulta de citas.
- [ ] T10 — Desarrollar e integrar las pantallas web.

## Instalación y ejecución

### Requisitos

- Java JDK 21.
- Maven (o utilizar Maven Wrapper incluido en el proyecto).
- IntelliJ IDEA u otro IDE compatible con Java.

### Pasos

1. Clonar el repositorio de GitHub.
2. Abrir la carpeta del proyecto en IntelliJ IDEA.
3. Esperar a que Maven descargue las dependencias.
4. Ejecutar la clase principal de Spring Boot.
5. Comprobar que el servidor se inicia correctamente en el puerto `8080`.

La aplicación todavía no dispone de endpoints funcionales ni de conexión a la base de datos.

## Autor

**David Garrido Quiles**

Módulo: Proyecto intermodular de desarrollo de aplicaciones multiplataforma.

Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM).

IES Gregorio Prieto — Curso 2026/2027.
