# 🏓 PadelMatch — App Flutter para jugadores de pádel

**PadelMatch** es una aplicación móvil multiplataforma (Flutter) diseñada para conectar jugadores de pádel fácilmente, permitiendo organizar partidos, registrarse, y emparejarse según nivel y zona geográfica.

## 🚀 Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- Flutter SDK: https://docs.flutter.dev/get-started/install
- Visual Studio Code: https://code.visualstudio.com/
- Extensión de Flutter en VS Code (Dart & Flutter)
- Git

## 🧰 Instalación y ejecución

1. Clona el repositorio:

```
git clone https://github.com/tuusuario/padelmatch.git
cd padelmatch
```

2. Instala las dependencias:

```
flutter pub get
```

3. Ejecuta en entorno de desarrollo:

- En emulador Android o iOS (o dispositivo físico conectado):

```
flutter run
```

- En navegador (Chrome recomendado):

```
flutter run -d chrome
```

## 🧪 Plataformas soportadas

| Plataforma     | Estado     | Notas                   |
|----------------|------------|-------------------------|
| Android        | ✅ Estable |                         |
| iOS            | ✅ Estable | Requiere Xcode (macOS)  |
| Web            | ✅ Estable | Chrome recomendado      |
| Windows/Linux  | ⚠️ Parcial | Solo para pruebas       |

## 📦 Estructura del proyecto

lib/  
├── main.dart                    # Entrada principal  
├── login_screen_neumorphic.dart  
└── onboarding/                 # Pantallas de onboarding  

assets/  
└── images/                     # Logotipos e ilustraciones

## 🛠 Tips por sistema operativo

### Linux / macOS

- Instala Flutter desde Snap o manualmente (.tar.gz)
- Agrega Flutter al PATH en `.bashrc`, `.zshrc` o `.bash_profile`
- Usa `flutter doctor` para diagnosticar el entorno
- Usa Chrome como navegador de desarrollo para web

### Windows

- Instala Git for Windows: https://gitforwindows.org/
- Agrega Flutter al PATH (`flutter/bin`)
- Usa Git Bash o PowerShell como terminal en VS Code
- Requiere Android Studio para usar emulador

## 🧹 Comandos útiles

```
flutter clean             # Limpia cachés y builds
flutter doctor            # Diagnóstico del entorno
flutter pub upgrade       # Actualiza dependencias
flutter devices           # Lista dispositivos conectados
flutter run -d chrome     # Ejecuta en navegador web
```

## 🤝 Contribuciones

¡Pull requests, mejoras de diseño, correcciones y sugerencias son bienvenidas!

## 👨‍💻 Desarrolladores

- Antonio Arjones Bello  
- Erik Viera Olivares

## 📃 Licencia

MIT © Antonio Arjones Bello & Erik Viera Olivares
