#!/bin/bash

# Definir la ruta raíz del proyecto
PROJECT_ROOT="$(dirname "$(dirname "$(dirname "$0")")")"

# Definir la ruta del archivo origen y destino
SOURCE_FILE="$PROJECT_ROOT/src/Tools/UpdateProto.sh"
DEST_FILE="$(dirname "$PROJECT_ROOT")/UpdateProto.sh"

echo "La ruta de origen es: $SOURCE_FILE"
echo "La ruta de destino es: $DEST_FILE"

# Comprobar si el archivo de destino existe
if [ -f "$DEST_FILE" ]; then
    echo "El archivo UpdateProto ya existe en el directorio padre del proyecto. No se realiza ninguna acción."
else
    # Copiar el archivo desde la ubicación de origen a la ubicación de destino
    cp "$SOURCE_FILE" "$DEST_FILE"
    echo "El archivo UpdateProto se ha copiado al directorio padre del proyecto."
fi
/home/kali/Desktop/ProtoInterfaz_kali_v0/../UpdateProto