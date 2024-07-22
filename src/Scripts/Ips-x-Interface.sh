#!/bin/bash

# Establecer la interfaz por defecto
interface=${1:-eth0}

# Obtener la IP del ordenador
my_ip=$(hostname -I | awk '{print $1}')

# Ejecutar arp-scan y filtrar las IPs no deseadas
sudo arp-scan --localnet -q -I $interface | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v -e "^$my_ip$" -e '\.254$' -e '\.1$'
