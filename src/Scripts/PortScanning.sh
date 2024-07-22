#!/bin/bash

# Verifica que se pase una IP como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <IP>"
    exit 1
fi

IP=$1

# Ejecuta nmap para obtener el SO
SO_INFO=$(nmap -O "$IP" | grep "OS details:" | sed 's/OS details://g' | xargs)

# Ejecuta nmap para obtener el escaneo de puertos y servicios
PORTS_INFO=$(nmap -sV "$IP" | grep -E "^\d+/tcp" | awk '{print "Port: " $1 "   Service: " $3}')

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
