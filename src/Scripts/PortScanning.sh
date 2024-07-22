#!/bin/bash

# Verifica que se pase una IP como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <IP>"
    exit 1
fi

IP=$1

# Ejecuta nmap y guarda la salida
SCAN_OUTPUT=$(sudo nmap -O -sV "$IP")

# Extrae la información del sistema operativo
SO_INFO=$(echo "$SCAN_OUTPUT" | grep -i "OS details:" | sed 's/OS details://g' | xargs)

# Extrae la información de los puertos y servicios
PORTS_INFO=$(echo "$SCAN_OUTPUT" | grep -E "^[0-9]+/tcp" | awk '{print "Port: " $1 "   Service: " $3}')

# Imprime la información en el formato requerido
echo "[$IP] Information:"
echo "SO: ${SO_INFO:-Unknown}"

echo
echo "PortScanning:"
if [ -n "$PORTS_INFO" ]; then
    echo "$PORTS_INFO"
else
    echo "No se encontraron puertos abiertos o servicios detectados."
fi
