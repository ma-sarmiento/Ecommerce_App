# 🛍️ Flutter Store App
Aplicación móvil desarrollada en **Flutter**, que implementa un catálogo de productos consumidos desde una **API REST** utilizando **DIO**. Incluye navegación, temas claro/oscuro, manejo de errores, arquitectura Repository + Service y pantalla de detalle.

Este proyecto forma parte de prácticas universitarias, pero está estructurado como una aplicación real lista para portafolio.

---

## ✅ Características principales
- ✅ Consumo de API REST real: FakeStore API
- ✅ Arquitectura Repository + Service
- ✅ Gestión de estados básica (loading, error, datos)
- ✅ Vista lista de productos
- ✅ Vista detalle de producto
- ✅ Imágenes locales y desde URL
- ✅ Modo claro / oscuro
- ✅ UI limpia y moderna
- ✅ Compatible con Android y emuladores ARM/Intel
- ✅ Proyecto ideal para línea de experiencia en GitHub

---

## 🧱 Arquitectura del proyecto

lib/
├── models/
│ └── product.dart
├── pages/
│ ├── home_page.dart
│ └── product_detail_page.dart
├── repository/
│ └── product_repository.dart
├── services/
│ └── api_service.dart
├── widgets/
│ └── product_card.dart
└── main.dart

assets/
├── data/
│ └── productos.json
└── images/
 └── laptop.png
 └── audifonos.jpg
 └── reloj.png

---

## 📄 Modelo de datos


**Patrones aplicados:**
- Repository Pattern
- Separación lógica por responsabilidades
- Uso de servicios externos (DIO)
- Modelo sólido para productos (Product)

---

## 🔌 API utilizada
**FakeStore API**  
https://fakestoreapi.com/products

Usada para obtener:
- título
- descripción
- precio
- categoría
- imagen desde URL

---

## 📸 Capturas de pantalla

### 🏠 Pantalla principal (Listado)
![img.png](img.png)

### 📄 Pantalla detalle
![img_1.png](img_1.png)


---

## 🚀 Instalación y ejecución

### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tuusuario/flutter_store_app.git
cd flutter_store_app

Instalar dependencias
flutter pub get
Ejecutar el proyecto
flutter run


📦 Dependencias principales
dio: ^5.4.0
intl: ^0.18.0
cupertino_icons: ^1.0.8

🌙 Modo claro / oscuro
El proyecto incluye un interruptor en la AppBar que permite cambiar de tema dinámicamente.