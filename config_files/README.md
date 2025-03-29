# Configuración de Guías de Estilo de Google para VSCode

Este directorio contiene archivos de configuración para aplicar las guías de estilo de Google en VSCode.

## Contenido

- `vscode-settings.json`: Configuración para VSCode
- `eslintrc.json`: Configuración de ESLint para JavaScript/TypeScript
- `prettierrc`: Configuración de Prettier para JavaScript/TypeScript
- `style.yapf`: Configuración de YAPF para Python
- `clang-format`: Configuración de Clang-Format para C++

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

## Instalación Manual

Si la instalación automática no funcionó, sigue estas instrucciones:

### 1. Para VSCode
Copia el contenido de `vscode-settings.json` en tu archivo `settings.json` de VSCode:
- En macOS: `~/Library/Application Support/Code/User/settings.json`
- En Linux: `~/.config/Code/User/settings.json`
- En Windows: `%APPDATA%\Code\User\settings.json`

### 2. Para ESLint
Copia el archivo `eslintrc.json` como `.eslintrc.json` en la raíz de tu proyecto.

### 3. Para Prettier
Copia el archivo `prettierrc` como `.prettierrc` en la raíz de tu proyecto.

### 4. Para YAPF (Python)
Copia el archivo `style.yapf` como `.style.yapf` en la raíz de tu proyecto.

Para instalar YAPF en entornos Python gestionados externamente:

**Opción 1: Usar pipx**
```bash
# Instalar pipx si no lo tienes
brew install pipx

# Instalar YAPF con pipx
pipx install yapf
```

**Opción 2: Crear un entorno virtual**
```bash
# Crear un entorno virtual para YAPF
python3 -m venv ~/yapf-venv
source ~/yapf-venv/bin/activate
pip install yapf
```

### 5. Para Clang-Format (C++)
Copia el archivo `clang-format` como `.clang-format` en la raíz de tu proyecto.

## Extensiones recomendadas para VSCode

- JavaScript/TypeScript: 
  - ESLint: `dbaeumer.vscode-eslint`
  - Prettier: `esbenp.prettier-vscode`

- Python:
  - Python: `ms-python.python`
  - Pylance: `ms-python.vscode-pylance`

- HTML/CSS:
  - HTML CSS Support: `ecmel.vscode-html-css`

- C++:
  - C/C++: `ms-vscode.cpptools`
  - Clang-Format: `xaver.clang-format`

- Go:
  - Go: `golang.go`

- Java:
  - Java Extension Pack: `vscjava.vscode-java-pack`

- Markdown:
  - Markdown All in One: `yzhang.markdown-all-in-one`
  - markdownlint: `DavidAnson.vscode-markdownlint`

- Shell:
  - ShellCheck: `timonwong.shellcheck`
  - shell-format: `foxundermoon.shell-format`

## Dependencias adicionales

Es posible que necesite instalar dependencias adicionales según el lenguaje:

- Para ESLint: `npm install -g eslint eslint-config-google`
- Para Go: `go get -u golang.org/x/lint/golint`
