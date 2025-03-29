#!/bin/bash

# Script para configurar VSCode con las guías de estilo de Google
# Fuente: https://google.github.io/styleguide/

echo "Configurando VSCode con las guías de estilo de Google..."

# Definir directorios
CURRENT_DIR=$(pwd)
CONFIG_FILES_DIR="$CURRENT_DIR/config_files"
CONFIG_DIR="$HOME/Library/Application Support/Code/User"

# Crear directorio para los archivos de configuración temporales
echo "Creando directorio para archivos de configuración en $CONFIG_FILES_DIR..."
mkdir -p "$CONFIG_FILES_DIR"

# Crear el directorio de VSCode si no existe
mkdir -p "$CONFIG_DIR"

echo "Creando archivos de configuración para linters..."

# ESLint para JavaScript/TypeScript
cat > "$CONFIG_FILES_DIR/eslintrc.json" << EOL
{
  "extends": ["eslint:recommended", "google"],
  "parserOptions": {
    "ecmaVersion": 2021,
    "sourceType": "module"
  },
  "env": {
    "browser": true,
    "node": true,
    "es2021": true
  }
}
EOL

# Prettier para JavaScript/TypeScript
cat > "$CONFIG_FILES_DIR/prettierrc" << EOL
{
  "singleQuote": true,
  "trailingComma": "all",
  "bracketSpacing": false,
  "arrowParens": "always",
  "printWidth": 80,
  "tabWidth": 2,
  "useTabs": false
}
EOL

# YAPF para Python
cat > "$CONFIG_FILES_DIR/style.yapf" << EOL
[style]
based_on_style = google
EOL

# Clang-format para C++
cat > "$CONFIG_FILES_DIR/clang-format" << EOL
BasedOnStyle: Google
EOL

# VSCode settings.json 
echo "Generando configuración para VSCode..."
cat > "$CONFIG_FILES_DIR/vscode-settings.json" << EOL
{
    // Google Style Guides Configuration
    
    // JavaScript Style Guide: https://google.github.io/styleguide/jsguide.html
    "javascript.format.insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
    "javascript.format.insertSpaceAfterKeywordsInControlFlowStatements": true,
    "javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
    "javascript.format.semicolons": "insert",
    "javascript.preferences.quoteStyle": "single",
    "javascript.preferences.importModuleSpecifier": "relative",
    "javascript.updateImportsOnFileMove.enabled": "always",
    
    // TypeScript Style Guide: https://google.github.io/styleguide/tsguide.html
    "typescript.format.insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
    "typescript.format.insertSpaceAfterKeywordsInControlFlowStatements": true,
    "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
    "typescript.format.semicolons": "insert",
    "typescript.preferences.quoteStyle": "single",
    "typescript.preferences.importModuleSpecifier": "relative",
    "typescript.updateImportsOnFileMove.enabled": "always",
    
    // Python Style Guide: https://google.github.io/styleguide/pyguide.html
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.formatting.provider": "yapf",
    "python.formatting.yapfArgs": ["--style", "{based_on_style: google}"],
    "editor.rulers": [80],
    
    // HTML/CSS Style Guide: https://google.github.io/styleguide/htmlcssguide.html
    "html.format.indentInnerHtml": true,
    "html.format.wrapAttributes": "auto",
    "css.lint.duplicateProperties": "warning",
    "css.lint.important": "warning",
    "css.lint.zeroUnits": "warning",
    
    // JSON Style Guide: https://google.github.io/styleguide/jsoncstyleguide.xml
    "json.format.enable": true,
    
    // C++ Style Guide: https://google.github.io/styleguide/cppguide.html
    "C_Cpp.clang_format_style": "Google",
    
    // Go Style Guide: https://google.github.io/styleguide/go/
    "go.formatTool": "gofmt",
    "go.lintTool": "golint",
    
    // Java Style Guide: https://google.github.io/styleguide/javaguide.html
    "java.format.settings.url": "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
    
    // Markdown Style Guide: https://google.github.io/styleguide/docguide/style.html
    "markdown.preview.breaks": true,
    "markdown.extension.toc.levels": "1..3",
    
    // Shell Style Guide: https://google.github.io/styleguide/shellguide.html
    "shellformat.flag": "-i 2 -ci",
    
    // Editor general settings
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.detectIndentation": true,
    "editor.formatOnSave": true,
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true
}
EOL

# Crear o actualizar settings.json de VSCode
SETTINGS_FILE="$CONFIG_DIR/settings.json"

echo "Aplicando configuración de VSCode a $SETTINGS_FILE..."
if [ -f "$SETTINGS_FILE" ]; then
    echo "El archivo settings.json ya existe. Creando copia de respaldo..."
    cp "$SETTINGS_FILE" "${SETTINGS_FILE}.backup"
    
    # Fusionar configuraciones existentes con las nuevas
    echo "Aplicando configuraciones nuevas..."
    cat "$CONFIG_FILES_DIR/vscode-settings.json" > "$SETTINGS_FILE"
else
    # Copiar el archivo directamente
    cp "$CONFIG_FILES_DIR/vscode-settings.json" "$SETTINGS_FILE"
fi

# Aplicar archivos de configuración en el directorio HOME del usuario
echo "Aplicando archivos de configuración en el directorio HOME..."
cp "$CONFIG_FILES_DIR/eslintrc.json" "$HOME/.eslintrc.json"
cp "$CONFIG_FILES_DIR/prettierrc" "$HOME/.prettierrc"
cp "$CONFIG_FILES_DIR/style.yapf" "$HOME/.style.yapf"
cp "$CONFIG_FILES_DIR/clang-format" "$HOME/.clang-format"

echo "Verificando si VSCode está instalado..."
# Comprobar si el comando code está disponible
if command -v code &> /dev/null; then
    echo "VSCode encontrado. Instalando extensiones recomendadas..."
    
    # Instalar extensiones de VSCode
    # JavaScript/TypeScript
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension esbenp.prettier-vscode
    
    # Python
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    
    # HTML/CSS
    code --install-extension ecmel.vscode-html-css
    
    # JSON
    code --install-extension mohsen1.prettify-json
    
    # C++
    code --install-extension ms-vscode.cpptools
    code --install-extension xaver.clang-format
    
    # Go
    code --install-extension golang.go
    
    # Java
    code --install-extension redhat.java
    code --install-extension vscjava.vscode-java-pack
    
    # Markdown
    code --install-extension yzhang.markdown-all-in-one
    code --install-extension DavidAnson.vscode-markdownlint
    
    # Shell
    code --install-extension timonwong.shellcheck
    code --install-extension foxundermoon.shell-format
    
    echo "Extensiones instaladas correctamente."
else
    echo "VSCode no está instalado o no es accesible desde la línea de comandos."
    echo "Para instalar las extensiones manualmente, consulta el archivo README.md."
fi

echo "Verificando e instalando dependencias necesarias..."

# Verificar e instalar dependencias
if command -v npm &> /dev/null; then
    echo "Instalando configuración global de ESLint..."
    npm install -g eslint eslint-config-google
else
    echo "npm no está instalado. No se puede instalar ESLint."
fi

# Instalar YAPF para Python (manejando entornos gestionados externamente)
echo "Instalando YAPF para Python..."

# 1. Verificar si pipx está instalado o instalarlo si es posible
if command -v pipx &> /dev/null; then
    echo "Instalando YAPF con pipx..."
    pipx install yapf
elif command -v brew &> /dev/null; then
    echo "Instalando pipx con Homebrew..."
    brew install pipx
    echo "Instalando YAPF con pipx..."
    pipx install yapf
else
    # 2. Alternativa: Crear un entorno virtual para YAPF
    echo "Creando un entorno virtual para YAPF..."
    VENV_DIR="$CONFIG_FILES_DIR/venv"
    python3 -m venv "$VENV_DIR"
    source "$VENV_DIR/bin/activate"
    python3 -m pip install yapf
    
    # Crear un script de activación para facilitar el uso
    cat > "$CONFIG_FILES_DIR/use-yapf.sh" << EOFVENV
#!/bin/bash
# Script para activar el entorno virtual con YAPF
source "$VENV_DIR/bin/activate"
echo "Entorno virtual activado. YAPF está disponible."
echo "Para usar YAPF, ejecuta: yapf --style=google [archivo.py]"
EOFVENV
    
    chmod +x "$CONFIG_FILES_DIR/use-yapf.sh"
    echo "Entorno virtual creado. Ejecuta '$CONFIG_FILES_DIR/use-yapf.sh' para activarlo."
    
    # Desactivar entorno virtual
    deactivate || true
fi

if command -v go &> /dev/null; then
    echo "Instalando golint para Go..."
    go get -u golang.org/x/lint/golint
else
    echo "Go no está instalado. No se puede instalar golint."
fi

echo "Creando README con instrucciones..."

cat > "$CONFIG_FILES_DIR/README.md" << EOL
# Configuración de Guías de Estilo de Google para VSCode

Este directorio contiene archivos de configuración para aplicar las guías de estilo de Google en VSCode.

## Contenido

- \`vscode-settings.json\`: Configuración para VSCode
- \`eslintrc.json\`: Configuración de ESLint para JavaScript/TypeScript
- \`prettierrc\`: Configuración de Prettier para JavaScript/TypeScript
- \`style.yapf\`: Configuración de YAPF para Python
- \`clang-format\`: Configuración de Clang-Format para C++

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
Copia el contenido de \`vscode-settings.json\` en tu archivo \`settings.json\` de VSCode:
- En macOS: \`~/Library/Application Support/Code/User/settings.json\`
- En Linux: \`~/.config/Code/User/settings.json\`
- En Windows: \`%APPDATA%\\Code\\User\\settings.json\`

### 2. Para ESLint
Copia el archivo \`eslintrc.json\` como \`.eslintrc.json\` en la raíz de tu proyecto.

### 3. Para Prettier
Copia el archivo \`prettierrc\` como \`.prettierrc\` en la raíz de tu proyecto.

### 4. Para YAPF (Python)
Copia el archivo \`style.yapf\` como \`.style.yapf\` en la raíz de tu proyecto.

Para instalar YAPF en entornos Python gestionados externamente:

**Opción 1: Usar pipx**
\`\`\`bash
# Instalar pipx si no lo tienes
brew install pipx

# Instalar YAPF con pipx
pipx install yapf
\`\`\`

**Opción 2: Crear un entorno virtual**
\`\`\`bash
# Crear un entorno virtual para YAPF
python3 -m venv ~/yapf-venv
source ~/yapf-venv/bin/activate
pip install yapf
\`\`\`

### 5. Para Clang-Format (C++)
Copia el archivo \`clang-format\` como \`.clang-format\` en la raíz de tu proyecto.

## Extensiones recomendadas para VSCode

- JavaScript/TypeScript: 
  - ESLint: \`dbaeumer.vscode-eslint\`
  - Prettier: \`esbenp.prettier-vscode\`

- Python:
  - Python: \`ms-python.python\`
  - Pylance: \`ms-python.vscode-pylance\`

- HTML/CSS:
  - HTML CSS Support: \`ecmel.vscode-html-css\`

- C++:
  - C/C++: \`ms-vscode.cpptools\`
  - Clang-Format: \`xaver.clang-format\`

- Go:
  - Go: \`golang.go\`

- Java:
  - Java Extension Pack: \`vscjava.vscode-java-pack\`

- Markdown:
  - Markdown All in One: \`yzhang.markdown-all-in-one\`
  - markdownlint: \`DavidAnson.vscode-markdownlint\`

- Shell:
  - ShellCheck: \`timonwong.shellcheck\`
  - shell-format: \`foxundermoon.shell-format\`

## Dependencias adicionales

Es posible que necesite instalar dependencias adicionales según el lenguaje:

- Para ESLint: \`npm install -g eslint eslint-config-google\`
- Para Go: \`go get -u golang.org/x/lint/golint\`
EOL

echo "=============================================================="
echo "✅ Configuración completada."
echo "✅ Archivos de configuración aplicados globalmente."
echo "✅ Se han creado copias en: $CONFIG_FILES_DIR"
echo "=============================================================="
echo "🔄 Por favor reinicia VSCode para que los cambios surtan efecto."
echo "📘 Si hubo algún problema, consulta las instrucciones manuales en $CONFIG_FILES_DIR/README.md" 