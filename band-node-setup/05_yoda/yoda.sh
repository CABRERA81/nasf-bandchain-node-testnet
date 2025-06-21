#!/bin/bash

# Wrapper para ejecutar Yoda con la configuración local.
# Uso: ./yoda.sh [argumentos de yoda]

set -e

# Asegura que Yoda esté en el PATH
export PATH="$HOME/go/bin:$PATH"

# Ejecuta Yoda con los argumentos que se le pasen
exec yoda "$@"
