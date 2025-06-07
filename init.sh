#!/bin/bash

echo "🚀 Iniciando entorno NASF BandChain Testnet..."
echo "----------------------------------------------"

# Verifica la rama actual
echo "📌 Rama actual:"
git branch

# Verifica el estado del repo
echo "🔍 Verificando cambios locales sin commitear..."
git status

# Intenta hacer pull de la rama remota
echo "🔄 Actualizando desde origin/master..."
git pull origin master

# Muestra estructura del repo
echo "📁 Estructura de carpetas:"
tree -L 2 || ls -R | less

# Instala dependencias si hay package.json
if [ -f "nasf-executor/package.json" ]; then
  echo "📦 Instalando dependencias en nasf-executor..."
  cd nasf-executor
  npm install
  cd ..
fi

echo "✅ Entorno listo para trabajar"
