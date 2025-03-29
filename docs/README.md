# Documentación de Google Style Guides para VSCode

Este directorio contiene la documentación para el proyecto Google Style Guides para VSCode, que se publica en GitHub Pages.

## Archivos principales

- `index.md`: Página principal en formato Markdown
- `index.html`: Página HTML alternativa
- `_config.yml`: Configuración de Jekyll para GitHub Pages

## Cómo funciona GitHub Pages

GitHub Pages utiliza Jekyll para procesar archivos Markdown y convertirlos en páginas HTML estáticas. Los archivos principales que Jekyll busca son:

1. `index.md` o `index.html` (página principal)
2. `_config.yml` (configuración de Jekyll)

## Solución de problemas de GitHub Pages

Si experimentas errores 404 al acceder a la página:

1. Verifica que GitHub Pages esté habilitado en la configuración del repositorio
   - Ve a la página de tu repositorio
   - Haz clic en "Settings" (Configuración)
   - Navega a "Pages" en la barra lateral
   - Confirma que "Source" está configurado en "Deploy from a branch"
   - Selecciona "main" como branch y "/docs" como directorio

2. Espera unos minutos para que GitHub construya el sitio

3. Verifica que los archivos de configuración (_config.yml) estén correctos

## Enlaces útiles

- [Documentación oficial de GitHub Pages](https://docs.github.com/es/pages)
- [Documentación de Jekyll](https://jekyllrb.com/docs/)
- [Temas compatibles con GitHub Pages](https://pages.github.com/themes/) 