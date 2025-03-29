---
layout: default
---

# Google Style Guides para VSCode

Configuración automatizada para implementar las guías de estilo de Google en Visual Studio Code, proporcionando formateadores y linters para diversos lenguajes de programación.

![Demo de Google Style Guides para VSCode](https://github.com/leonvallejoss/google-style-guides-vscode/raw/main/assets/demo.gif)

## Descripción general

Google Style Guides para VSCode es un conjunto de scripts y configuraciones que implementan automáticamente las guías de estilo oficiales de Google en Visual Studio Code. Este proyecto facilita la configuración de linters y formateadores para múltiples lenguajes de programación.

### ¿Por qué usar Google Style Guides?

Las guías de estilo de Google establecen estándares reconocidos en la industria para escribir código limpio, legible y mantenible. Al seguir estas guías, aseguras que tu código sea consistente y siga buenas prácticas de programación.

## Características principales

- **Multi-lenguaje**: Compatible con JavaScript, TypeScript, Python, HTML/CSS, JSON, C++, Go, Java, Markdown y Shell.
- **Instalación automatizada**: Scripts que configuran VSCode y todas las herramientas necesarias con un solo comando.
- **Adaptativo**: Soluciona automáticamente problemas como entornos Python gestionados externamente.
- **Documentado**: Instrucciones detalladas, ejemplos y solución de problemas para cada configuración.

## Instalación

### Instalación completa

Para configurar todas las guías de estilo:

```bash
# Clonar el repositorio
git clone https://github.com/leonvallejoss/google-style-guides-vscode.git
cd google-style-guides-vscode

# Ejecutar el script principal
chmod +x vscode-google-style-config.sh
./vscode-google-style-config.sh
```

### Solo YAPF para Python

Si necesitas configurar específicamente YAPF para entornos Python gestionados externamente:

```bash
chmod +x install-yapf.sh
./install-yapf.sh
```

## Guías de estilo implementadas

- [JavaScript Style Guide](https://google.github.io/styleguide/jsguide.html)
- [TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html)
- [Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html)
- [JSON Style Guide](https://google.github.io/styleguide/jsoncstyleguide.xml)
- [C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- [Go Style Guide](https://google.github.io/styleguide/go/)
- [Java Style Guide](https://google.github.io/styleguide/javaguide.html)
- [Markdown Style Guide](https://google.github.io/styleguide/docguide/style.html)
- [Shell Style Guide](https://google.github.io/styleguide/shellguide.html)

## Resolución de problemas comunes

### Error "externally-managed-environment" en Python

Este error ocurre en sistemas con Python gestionado externamente (como macOS recientes).

**Solución:** Usa nuestro script `install-yapf.sh` que crea un entorno virtual para YAPF.

### Problemas de permisos

Si encuentras errores "Permission denied" al ejecutar los scripts:

```bash
sudo chmod -R 755 google-style-guides-vscode
cd google-style-guides-vscode
sudo chmod +x *.sh
```

## Enlaces

- [Repositorio en GitHub](https://github.com/leonvallejoss/google-style-guides-vscode)
- [Reportar problema](https://github.com/leonvallejoss/google-style-guides-vscode/issues/new)

---

Creado por [León Vallejos](https://github.com/leonvallejoss) | Licencia MIT | Basado en las [Guías de Estilo de Google](https://google.github.io/styleguide/) 