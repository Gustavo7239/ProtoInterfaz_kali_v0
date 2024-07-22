#!/bin/bash

# Obtener y mostrar los nombres de las interfaces de red
ip -o link show | awk -F': ' '{print $2}'