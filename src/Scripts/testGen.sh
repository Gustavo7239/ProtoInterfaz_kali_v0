#!/bin/bash
echo "---------------------[Lista de interfaz]--------------------"
./Interface-List.sh

# Solicita la entrada del usuario
echo -e "\n\n--------------[Introduce la interfaz a elegir]--------------"
read -p "> " resultado

./Ips-x-Interface.sh $resultado
