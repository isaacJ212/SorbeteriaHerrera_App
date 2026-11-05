<div align="center">

  <img src="assets/logo.png" alt="Sorbetería Herrera Logo" width="400">

  <h1>Sorbetería Herrera App</h1>

  <h3><i>El sabor de lo natural</i></h3>

  [![.NET](https://img.shields.io/badge/.NET-10.0-512BD4?logo=dotnet)](https://dotnet.microsoft.com/)
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter)](https://flutter.dev/)
  [![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?logo=microsoftsqlserver)](https://www.microsoft.com/sql-server)
  [![Git](https://img.shields.io/badge/Git-F05032?logo=git)](https://git-scm.com/)

</div>

---

##  Sorbetería Herrera App

**Sorbetería Herrera App** es una aplicación móvil desarrollada para apoyar la gestión administrativa y consulta de información de **Sorbetería Herrera**.

La aplicación complementa el sistema web transaccional existente, permitiendo a los usuarios autorizados consultar información del negocio desde un dispositivo móvil.

El proyecto integra una aplicación móvil desarrollada con **Flutter** con servicios desarrollados utilizando **.NET 10** y una base de datos **SQL Server**.

---

## 👥 Integrantes del Proyecto

Este sistema fue diseñado, desarrollado e integrado por el siguiente equipo:

- **Isaac Enmanuel Acuña Jiménez → [GitHub](https://github.com/isaacJ212)
- **Jafet Emanuel Sánchez Cisneros → [GitHub](https://github.com/JafetSanchez7v7)
- **Fabian Enrique Arteaga Hernández → [GitHub](https://github.com/Fabian-Arteaga)

---

## 📋 Tabla de Contenidos

1. [Descripción General del Proyecto](#1-descripción-general-del-proyecto)
2. [Tecnologías Utilizadas](#2-tecnologías-utilizadas)
3. [Funcionalidades Principales](#3-funcionalidades-principales)
4. [Arquitectura del Sistema](#4-arquitectura-del-sistema)
5. [Diseño de la Aplicación](#5-diseño-de-la-aplicación)
6. [Base de Datos](#6-base-de-datos)
7. [Estructura del Proyecto](#7-estructura-del-proyecto)
8. [Instalación y Configuración](#8-instalación-y-configuración)
9. [Ejecución del Proyecto](#9-ejecución-del-proyecto)


---

# 1. Descripción General del Proyecto

**Sorbetería Herrera App** es una aplicación móvil orientada a la gestión administrativa y consulta de información de **Sorbetería Herrera**.

El proyecto surge como una evolución del sistema web transaccional existente, con el propósito de facilitar el acceso a información administrativa y operacional desde dispositivos móviles.

La aplicación permite consultar información relacionada con:

- Productos
- Inventario
- Ventas
- Usuarios
- Reportes
- Indicadores del negocio

La solución está orientada a usuarios autorizados del sistema y busca complementar las funcionalidades existentes mediante una aplicación móvil.

---

### 🎯 Objetivo

Desarrollar una aplicación móvil para la gestión administrativa y el análisis de información de Sorbetería Herrera, integrada con el sistema web existente, servicios en la nube y un entorno analítico, facilitando el acceso a la información operativa y apoyando la toma de decisiones del negocio.

---

# 2. Tecnologías Utilizadas

## 📱 Frontend

| Tecnología | Descripción |
|---|---|
| **Flutter** | Framework utilizado para el desarrollo de la aplicación móvil |
| **Dart** | Lenguaje de programación utilizado por Flutter |

## ⚙️ Backend

| Tecnología | Descripción |
|---|---|
| **.NET 10** | Plataforma utilizada para el desarrollo del backend |
| **ASP.NET Core Web API** | Desarrollo de los servicios de la API |
| **C#** | Lenguaje utilizado para el backend |

## 🗄️ Base de Datos

| Tecnología | Descripción |
|---|---|
| **SQL Server** | Base de datos utilizada por el sistema transaccional |

## 🛠️ Herramientas

| Herramienta | Uso |
|---|---|
| **Git** | Control de versiones |
| **GitHub** | Repositorio y colaboración |
| **Visual Studio Code** | Desarrollo del proyecto |

---

# 3. Funcionalidades Principales

## 🔐 Autenticación

- Inicio de sesión mediante usuario y contraseña.
- Validación de credenciales mediante la API.
- Autenticación mediante JWT.
- Cierre de sesión.
- Control de acceso a las pantallas de la aplicación.

---

## 🏠 Dashboard

El dashboard funciona como pantalla principal de la aplicación y presenta información relacionada con el estado del negocio.

Incluye indicadores y gráficos relacionados con:

- Ventas.
- Productos más vendidos.
- Valor del inventario.

---

## 🍨 Productos

Permite consultar la información de los productos registrados en el sistema.

La consulta contempla información como:

- Nombre del producto.
- Línea.
- Sabor.
- Presentación.
- Precio.

---

## 📦 Inventario

Permite consultar las existencias actuales de los productos.

Entre la información disponible se encuentra:

- Cantidad disponible.
- Productos con stock bajo.
- Búsqueda de productos.
- Información relacionada con el inventario.

---

## 🛒 Ventas

Permite consultar las ventas realizadas.

La aplicación contempla:

- Consulta de ventas.
- Filtrado por fecha.
- Filtrado por producto.
- Total vendido.
- Detalle de los productos vendidos.

---

## 📊 Reportes

La aplicación permite consultar información mediante reportes e indicadores para apoyar el análisis de las operaciones del negocio.

---

## 👤 Usuarios

Usuarios definidos para la aplicación se encuentran:

- **Administrador**
- 

El administrador tiene acceso a las funcionalidades administrativas de la aplicación.

---

# 4. Arquitectura del Sistema

El proyecto está compuesto por una aplicación móvil, servicios backend y una base de datos.

```text
┌─────────────────────────────────────────┐
│        Sorbetería Herrera App           │
│                                         │
│            Flutter / Dart               │
│          Aplicación móvil               │
└───────────────────┬─────────────────────┘
                    │
                    │ HTTP / REST
                    ▼
┌─────────────────────────────────────────┐
│                Backend                  │
│                                         │
│              .NET 10                   │
│           ASP.NET Core API             │
│                C#                      │
└───────────────────┬─────────────────────┘
                    │
                    │ Acceso a datos
                    ▼
┌─────────────────────────────────────────┐
│              SQL Server                 │
│                                         │
│           Base de datos                 │
└─────────────────────────────────────────┘
