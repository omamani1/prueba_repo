#!/bin/bash
composer install
npm run build
npm install --production

echo "📦 Limpiando caché anterior..."
php artisan config:clear
php artisan route:clear
php artisan view:clear

echo "📌 Ejecutando migraciones..."
php artisan migrate --force

echo "🚀 Iniciando servidor Laravel en puerto 8080"
php artisan serve --host=0.0.0.0 --port=8080
