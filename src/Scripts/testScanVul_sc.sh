#!/bin/bash                                                                           

# Obtener la IP del ordenador
my_ip=$(hostname -I | awk '{print $1}')

# Ejecutar arp-scan y filtrar las IPs no deseadas
sudo arp-scan --localnet -q -I eth0 | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v -e "^$my_ip$" -e '\.254$' -e '\.1$