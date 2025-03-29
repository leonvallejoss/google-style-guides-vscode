#!/bin/bash

# Script para instalar YAPF en un entorno virtual para usarlo con la configuración de Google

echo "📦 Instalando YAPF (Python formatter con estilo Google)..."

# Directorio para el entorno virtual
VENV_DIR="$HOME/.yapf-venv"

# Crear el entorno virtual
echo "🔄 Creando entorno virtual en $VENV_DIR..."
python3 -m venv "$VENV_DIR"

# Activar el entorno virtual
echo "🔄 Activando entorno virtual..."
source "$VENV_DIR/bin/activate"

# Instalar YAPF
echo "🔄 Instalando YAPF en el entorno virtual..."
python3 -m pip install yapf

# Crear archivo .style.yapf en el HOME si no existe
if [ ! -f "$HOME/.style.yapf" ]; then
    echo "🔄 Creando archivo .style.yapf en $HOME con estilo Google..."
    cat > "$HOME/.style.yapf" << EOL
[style]
based_on_style = google
EOL
fi

# Crear alias para YAPF
ALIAS_CMD="alias yapf=\"$VENV_DIR/bin/yapf --style=google\""

# Verificar shell y añadir alias
add_alias_to_shell() {
    if [ -f "$1" ]; then
        if ! grep -q "alias yapf" "$1"; then
            echo "🔄 Añadiendo alias de YAPF a $1..."
            echo "$ALIAS_CMD" >> "$1"
            echo "export PATH=\"\$PATH:$VENV_DIR/bin\"" >> "$1"
        else
            echo "✅ El alias de YAPF ya existe en $1."
        fi
    fi
}

# Añadir a diferentes archivos de configuración de shell
add_alias_to_shell "$HOME/.bashrc"
add_alias_to_shell "$HOME/.zshrc"
add_alias_to_shell "$HOME/.bash_profile"

# Crear script de ayuda
echo "🔄 Creando script de ayuda..."
mkdir -p "$HOME/bin"
cat > "$HOME/bin/yapf-help" << EOL
#!/bin/bash

echo "📚 Uso de YAPF con estilo Google:"
echo "   yapf --style=google archivo.py > archivo_formateado.py"
echo ""
echo "🔄 Para formatear un archivo en su lugar:"
echo "   yapf --style=google -i archivo.py"
echo ""
echo "🔄 Para formatear todos los archivos Python en un directorio:"
echo "   yapf --style=google -i -r directorio/"
EOL
chmod +x "$HOME/bin/yapf-help"

# Desactivar el entorno virtual
deactivate

echo "============================================="
echo "✅ Instalación completada."
echo "✅ YAPF está instalado en $VENV_DIR"
echo "✅ Se ha añadido un alias 'yapf' a tu shell."
echo "📘 Para usar YAPF: yapf --style=google archivo.py"
echo "📘 Para ver ayuda: yapf-help"
echo "============================================="
echo "🔄 Para que los cambios surtan efecto, reinicia tu terminal o ejecuta:"
echo "   source ~/.bashrc   (si usas Bash)"
echo "   source ~/.zshrc    (si usas Zsh)" 