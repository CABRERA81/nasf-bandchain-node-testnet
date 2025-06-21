#!/bin/bash

set -e

echo "🚀 Empaquetando executor NASF para AWS Lambda..."

# Paso 1: Verificar que index.js existe
if [ ! -f "index.js" ]; then
  echo "❌ Error: index.js no existe en esta carpeta."
  exit 1
fi

# Paso 2: Borrar el ZIP anterior si existe
if [ -f "../nasf-executor.zip" ]; then
  echo "🧹 Eliminando ZIP anterior..."
  rm ../nasf-executor.zip
fi

# Paso 3: Crear ZIP nuevo desde el contenido actual
echo "📦 Creando nuevo nasf-executor.zip..."
zip -r ../nasf-executor.zip .

# Paso 4: Verificar que index.js está dentro del ZIP
echo "🔍 Verificando contenido del ZIP..."
unzip -l ../nasf-executor.zip | grep index.js > /dev/null

if [ $? -ne 0 ]; then
  echo "❌ Error: index.js no está dentro del ZIP. Algo salió mal."
  exit 1
fi

echo "✅ ¡ZIP creado correctamente y listo para subir a Lambda!"

