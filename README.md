# Configuración de Guías de Estilo de Google para VSCode

Este directorio contiene archivos de configuración para aplicar las guías de estilo de Google en VSCode.

## Contenido

- `vscode-google-style-config.sh`: Script para configurar VSCode
- `.eslintrc.json`: Configuración de ESLint para JavaScript/TypeScript
- `.prettierrc`: Configuración de Prettier para JavaScript/TypeScript
- `.style.yapf`: Configuración de YAPF para Python
- `.clang-format`: Configuración de Clang-Format para C++

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

## Uso

Para aplicar la configuración, ejecute el script:

```bash
chmod +x vscode-google-style-config.sh
./vscode-google-style-config.sh
```

Después de ejecutar el script, reinicie VSCode para que los cambios surtan efecto.

## Nota

Es posible que necesite instalar dependencias adicionales según el lenguaje:

- Para ESLint: `npm install -g eslint eslint-config-google`
- Para YAPF: `pip install yapf`
- Para Go: `go get -u golang.org/x/lint/golint`
