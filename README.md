Este README contiene los pasos necesarios para poder levantar la aplicación.

Todos los comandos se deben de correr en la consola dentro del directorio del proyecto

Ruby version: 3.2.0 (para colocar esta versión por defecto en sus computadora corra rvm use default 3.2.0)

Instalar todas las gemas: bundle install

Crear la base de datos: rake db:create

Correr las migraciones: rake db:migrate

Levantar el servidor: rails server

Eliminar base de datos rake db:drop