#!/bin/bash

ejecutar() {
    echo "Ejecutando el programa..."
    python ProtoInterfaz_kali_v0/index.py
}

actualizar() {
    echo "Actualizando el programa..."
    sudo rm -r ProtoInterfaz_kali_v0/
    git clone https://github.com/Gustavo7239/ProtoInterfaz_kali_v0.githttps://github.com/Gustavo7239/ProtoInterfaz_kali_v0.git
    python ProtoInterfaz_kali_v0/index.py
}

instalarRecursos() {
    echo "Comprobando e instalando los recursos necesarios..."

    if ! command -v nmap &> /dev/null; then
        echo "Instalando nmap..."
        sudo apt-get install -y nmap
    else
        echo "nmap ya está instalado."
    fi

    if ! command -v arp-scan &> /dev/null; then
        echo "Instalando arp-scan..."
        sudo apt-get install -y arp-scan
    else
        echo "arp-scan ya está instalado."
    fi
}

echo "Introduce un número: 
1. Ejecutar
2. Actualizar 
3. Instalar Recursos"
read -p "> " numero

case $numero in
    1)
        ejecutar
        ;;
    2)
        actualizar
        ;;
    3)
        instalarRecursos
        ;;
    *)
        echo "Número no válido. Por favor, introduce 1, 2 o 3."
        ;;
esac
