#!/bin/bash
echo "---------------------[Lista de interfaz]--------------------"
./Interface-List.sh

echo -e "\n\n--------------[Introduce la interfaz a elegir]--------------"
read -p "> " interface

./Ips-x-Interface.sh $interface

echo -e "\n\n--------------[Introduce la IP a escanear]--------------"
read -p "> " direccionIP

./PortScanning.sh $direccionIP
