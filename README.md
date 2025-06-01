# 🏓 PadelMatch — App Flutter para jugadores de pádel

**PadelMatch** es una aplicación móvil multiplataforma (Flutter) para conectar jugadores de pádel, organizar partidos y emparejarse según nivel y zona geográfica.

## 🚀 Requisitos previos

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Visual Studio Code](https://code.visualstudio.com/)
- Extensión Dart & Flutter para VS Code
- Git

## 🧰 Instalación y ejecución

```sh
git clone https://github.com/tuusuario/padelmatch.git
cd padelmatch
flutter pub get
```

### Ejecutar en desarrollo

- **Emulador Android/iOS o dispositivo físico:**
  ```sh
  flutter run
  ```
- **Navegador (Chrome recomendado):**
  ```sh
  flutter run -d chrome
  ```

## 🧪 Plataformas soportadas

| Plataforma     | Estado     | Notas                   |
|---------------|------------|-------------------------|
| Android        | ✅ Estable |                         |
| iOS            | ✅ Estable | Requiere Xcode (macOS)  |
| Web            | ✅ Estable | Chrome recomendado      |
| Windows/Linux  | ⚠️ Parcial | Solo para pruebas       |

## 📦 Estructura del proyecto

```
lib/
  main.dart                # Entrada principal
  features/
    auth/                  # Pantallas de login
    onboarding/            # Onboarding y registro
  shared/                  # Temas, widgets reutilizables
  l10n/                    # Localización
assets/
  images/                  # Logotipos e ilustraciones
  fonts/                   # Tipografías
```

## 🛠 Tips por sistema operativo

### Linux / macOS
- Instala Flutter desde Snap o manualmente (.tar.gz)
- Agrega Flutter al PATH en `.bashrc`, `.zshrc` o `.bash_profile`
- Usa `flutter doctor` para diagnosticar el entorno
- Usa Chrome como navegador de desarrollo para web

### Windows
- Instala [Git for Windows](https://gitforwindows.org/)
- Agrega Flutter al PATH (`flutter/bin`)
- Usa Git Bash o PowerShell como terminal en VS Code
- Requiere Android Studio para usar emulador

## 🧹 Comandos útiles

```sh
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
