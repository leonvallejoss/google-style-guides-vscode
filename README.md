# Google Style Guides para VSCode

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![VSCode](https://img.shields.io/badge/VSCode-v1.60+-blue.svg)](https://code.visualstudio.com/)
[![Google Style Guide](https://img.shields.io/badge/Google-Style%20Guide-4285F4.svg)](https://google.github.io/styleguide/)

Configuración automatizada para implementar las guías de estilo de Google en Visual Studio Code, proporcionando formateadores y linters para diversos lenguajes de programación.

![Demo de Google Style Guides para VSCode](https://github.com/leonvallejoss/google-style-guides-vscode/raw/main/assets/demo.gif)

> 📝 **Nota:** Visita nuestra [documentación completa](https://leonvallejoss.github.io/google-style-guides-vscode/) para guías más detalladas.

## Índice

- [Descripción general](#descripción-general)
- [Lenguajes soportados](#lenguajes-soportados)
- [Instalación](#instalación)
- [Uso](#uso)
- [Estructura de archivos](#estructura-de-archivos)
- [Configuración avanzada](#configuración-avanzada)
- [Resolución de problemas](#resolución-de-problemas)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Descripción general

Este proyecto proporciona scripts de configuración para aplicar automáticamente las guías de estilo oficiales de Google en Visual Studio Code. Las guías de estilo de Google son ampliamente reconocidas por promover prácticas coherentes y de alta calidad en el desarrollo de software.

**Ventajas principales:**

- **Configuración automatizada:** Scripts optimizados para reducir el tiempo de configuración
- **Soporte multi-lenguaje:** Configuraciones consistentes para todos los lenguajes principales
- **Detección inteligente:** Adaptación a entornos Python gestionados externamente
- **Documentación completa:** Instrucciones detalladas y soluciones de problemas comunes

## Lenguajes soportados

El proyecto incluye configuraciones específicas para los siguientes lenguajes:

| Lenguaje | Guía de estilo | Herramientas incluidas |
|----------|----------------|------------------------|
| JavaScript | [Google JavaScript Style Guide](https://google.github.io/styleguide/jsguide.html) | ESLint + Prettier |
| TypeScript | [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html) | ESLint + Prettier |
| Python | [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) | YAPF + Pylint |
| HTML/CSS | [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html) | HTML/CSS Validator |
| JSON | [Google JSON Style Guide](https://google.github.io/styleguide/jsoncstyleguide.xml) | JSON Formatter |
| C++ | [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html) | Clang-Format |
| Go | [Google Go Style Guide](https://google.github.io/styleguide/go/) | gofmt + golint |
| Java | [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) | Google Java Format |
| Markdown | [Google Markdown Style Guide](https://google.github.io/styleguide/docguide/style.html) | markdownlint |
| Shell | [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html) | ShellCheck + shell-format |

## Instalación

### Requisitos previos

- Visual Studio Code 1.60+
- Git
- Terminal (Bash/Zsh)
- Permisos de administrador para instalar extensiones y configurar VS Code

### Método 1: Instalación completa (recomendado)

```bash
# Clonar el repositorio
git clone https://github.com/leonvallejoss/google-style-guides-vscode.git
cd google-style-guides-vscode

# Ejecutar el script principal
chmod +x vscode-google-style-config.sh
./vscode-google-style-config.sh
```

**El script realizará las siguientes acciones:**

1. Crear/actualizar la configuración de VSCode (`settings.json`)
2. Instalar archivos de configuración para linters/formatters
3. Instalar extensiones recomendadas de VSCode (si está disponible en CLI)
4. Instalar dependencias como ESLint con la configuración de Google

### Método 2: Instalación solo de YAPF para Python

Esta opción es particularmente útil para entornos Python gestionados externamente (como en macOS recientes):

```bash
chmod +x install-yapf.sh
./install-yapf.sh
```

**El script específico de YAPF:**

1. Crea un entorno virtual para YAPF
2. Instala YAPF en el entorno aislado
3. Configura un alias para facilitar su uso
4. Crea un script de ayuda con comandos de ejemplo

## Uso

### Formateo automático de código

Una vez instalado, VSCode formateará automáticamente el código según las guías de estilo de Google al guardar los archivos (si `editor.formatOnSave` está habilitado en la configuración).

### Comandos comunes

**JavaScript/TypeScript:**
```bash
# Formatear archivo según estilo Google
npx eslint --fix archivo.js
```

**Python:**
```bash
# Formatear archivo según estilo Google
yapf --style=google -i archivo.py
```

**C++:**
```bash
# Formatear archivo según estilo Google
clang-format -style=Google -i archivo.cpp
```

**Go:**
```bash
# Formatear archivo según estilo Google
gofmt -w archivo.go
```

### Verificar la configuración

Para verificar que la configuración se ha aplicado correctamente:

1. Abra VSCode
2. Abra un archivo del lenguaje deseado
3. Formatee el documento (Shift+Alt+F o Cmd+Shift+F en macOS)
4. El código debería formatearse según las guías de estilo de Google

## Estructura de archivos

```
google-style-guides-vscode/
├── config_files/                  # Configuraciones para cada lenguaje
│   ├── clang-format               # Configuración para C++
│   ├── eslintrc.json              # Configuración para JavaScript/TypeScript
│   ├── prettierrc                 # Configuración para formateo
│   ├── style.yapf                 # Configuración para Python
│   ├── vscode-settings.json       # Configuración para VSCode
│   └── README.md                  # Instrucciones manuales
├── docs/                          # Documentación para GitHub Pages
├── assets/                        # Imágenes y GIFs demostrativos
├── install-yapf.sh                # Script específico para YAPF
├── vscode-google-style-config.sh  # Script principal
├── LICENSE                        # Licencia MIT
└── README.md                      # Este archivo
```

## Configuración avanzada

### Personalización de reglas

Si necesita personalizar algunas reglas específicas mientras mantiene la mayor parte del estilo de Google:

1. Edite los archivos de configuración en el directorio `config_files/`
2. Ejecute nuevamente el script principal para aplicar los cambios
3. O copie manualmente los archivos modificados a sus ubicaciones correspondientes

### Integración con CI/CD

Para integraciones de CI/CD, puede usar los archivos de configuración directamente:

```yaml
# Ejemplo para GitHub Actions
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Lint JavaScript
        run: |
          npm install eslint eslint-config-google
          npx eslint --config ./google-style-guides-vscode/config_files/eslintrc.json ./src
```

## Resolución de problemas

### Problema: Error al instalar YAPF en macOS

**Síntoma:** Error "externally-managed-environment" al intentar instalar YAPF.

**Solución:** Use el script `install-yapf.sh` que crea un entorno virtual:

```bash
./install-yapf.sh
source ~/.zshrc  # Para activar el alias
```

### Problema: VSCode no reconoce la configuración

**Síntoma:** VSCode no aplica el formato según las guías de estilo de Google.

**Solución:**
1. Verifique que la ruta de configuración es correcta:
   - macOS: `~/Library/Application Support/Code/User/settings.json`
   - Linux: `~/.config/Code/User/settings.json`
   - Windows: `%APPDATA%\Code\User\settings.json`
2. Reinicie VSCode después de la instalación
3. Asegúrese de que las extensiones necesarias estén instaladas

### Problema: Errores de permisos

**Síntoma:** Errores "Permission denied" al ejecutar los scripts.

**Solución:**
```bash
sudo chmod -R 755 google-style-guides-vscode
cd google-style-guides-vscode
sudo chmod +x *.sh
```

## Documentación completa

Para una experiencia de documentación mejorada, visita nuestra [página de documentación](https://leonvallejoss.github.io/google-style-guides-vscode/) que incluye:

- Guías paso a paso con capturas de pantalla
- Ejemplos de código antes/después para cada lenguaje
- Tutoriales para configuraciones avanzadas
- Preguntas frecuentes
- Ejemplos de integración con entornos populares

## Contribuciones

Las contribuciones son bienvenidas y valoradas. Para contribuir:

1. Realice un fork del repositorio
2. Cree una rama para su funcionalidad (`git checkout -b feature/nueva-funcionalidad`)
3. Realice los cambios siguiendo las [guías de contribución de Google](https://github.com/google/eng-practices/blob/master/review/developer/index.md)
4. Confirme sus cambios (`git commit -am 'Añadir: nueva funcionalidad'`)
5. Envíe los cambios (`git push origin feature/nueva-funcionalidad`)
6. Cree una Pull Request

## Licencia

Este proyecto está licenciado bajo la [Licencia MIT](LICENSE) - vea el archivo LICENSE para más detalles.

## Autor

- **León Vallejos** - [leonvallejoss](https://github.com/leonvallejoss)

## Agradecimientos

- [Google](https://google.github.io/styleguide/) por sus excelentes guías de estilo
- La comunidad de VSCode por sus extensiones y herramientas
- Todos los mantenedores de linters y formatters incluidos en este proyecto

## 🚧 Proyecto en Evolución

Este proyecto se encuentra en desarrollo activo y continua evolución. Estamos trabajando constantemente para:

- Añadir soporte para más lenguajes de programación
- Mejorar la compatibilidad con diferentes entornos de desarrollo
- Optimizar los scripts de instalación
- Incorporar las últimas actualizaciones de las guías de estilo de Google

Si encuentras algún problema o tienes sugerencias para mejorar, no dudes en [abrir un issue](https://github.com/leonvallejoss/google-style-guides-vscode/issues/new) o contribuir directamente con un pull request. ¡Tu feedback es muy valioso para el crecimiento de este proyecto!

**Próximas características:**
- Integración con más herramientas de CI/CD
- Soporte para entornos containerizados (Docker)
- Configuraciones para equipos de desarrollo
- Plugins adicionales para IDEs basados en JetBrains
