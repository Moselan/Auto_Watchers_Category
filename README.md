# Redmine Auto Watchers
Este plugin asigna automáticamente seguidores a un ticket según la categoría seleccionada.

## Instalación
1. Clona este repositorio en la carpeta `plugins/` de Redmine.
2. Ejecuta `bundle install`.
3. Ejecuta `rake db:migrate`.
4. Reinicia Redmine.

## Uso
- Configura los seguidores desde `/category_watchers`.
- Al crear o editar un issue, los seguidores se asignarán automáticamente.
