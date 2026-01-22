#!/bin/bash

# --- CONFIGURACIÓN ---
LOG_FILE="historial_busquedas.log"

while true; do
    clear
    # BANNER
    echo -e "\e[1;34m"
    cat << "EOF"
    ___         __             ____  _____ ___ _   
   /   | __  __/ /_____       / __ \/ ___//_  / | / /
  / /| |/ / / / __/ __ \     / / / /\__ \  / /  |/ / 
 / ___ / /_/ / /_/ /_/ /    / /_/ /___/ / / /|    /  
/_/  |_\__,_/\__/\____/____/\____//____/ /_/ |_/_/   
                     /_____/  by Richard-CyberSec
EOF
    echo -e "\e[0m"

    echo -e "\e[1;33m      --- PANEL DE CONTROL OSINT --- \e[0m"
    echo "------------------------------------------------"
    echo "1) Investigación Completa (Nombre + DNI)"
    echo "2) Rastro en Redes Sociales (Username)"
    echo "3) Ver Historial de Búsquedas"
    echo "4) Salir del programa"
    echo "------------------------------------------------"
    read -p "Selecciona una opción [1-4]: " opcion

    case $opcion in
        1)
            read -p "Introduce Nombre y Apellidos: " nombre
            [ -z "$nombre" ] && continue
            read -p "Introduce DNI: " dni
            CARPETA="Investigacion_${nombre// /_}"
            mkdir -p "$CARPETA"
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] INVESTIGACIÓN: $nombre | DNI: $dni" >> "$LOG_FILE"
            BUSQUEDA_URL="${nombre// /+}"
            sudo -u $(logname) firefox "https://www.google.com/search?q=$BUSQUEDA_URL" &
            [ ! -z "$dni" ] && sudo -u $(logname) firefox "https://www.google.com/search?q=$dni" &
            echo -e "\e[1;32m[OK] Lanzado. Volviendo al menú...\e[0m"
            sleep 3
            ;;
        2)
            read -p "Introduce Username: " usuario
            [ -z "$usuario" ] && continue
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] SOCIAL: $usuario" >> "$LOG_FILE"
            sudo -u $(logname) firefox "https://www.instagram.com/$usuario" &
            sudo -u $(logname) firefox "https://twitter.com/$usuario" &
            echo -e "\e[1;32m[OK] Abriendo redes. Volviendo al menú...\e[0m"
            sleep 3
            ;;
        3)
            echo -e "\n\e[1;33m--- HISTORIAL DE ACTIVIDAD ---\e[0m"
            echo "------------------------------------------"
            if [ -f "$LOG_FILE" ]; then
                cat "$LOG_FILE"
            else
                echo "Historial vacío."
            fi
            echo "------------------------------------------"
            # USAMOS ESTA PAUSA PARA QUE NO SE BORRE LA LÍNEA
            echo -e "\e[1;32mModo lectura activo.\e[0m"
            read -p "Pulsa [ENTER] para regresar al menú..."
            ;;
        4)
            echo "¡Hasta pronto, Richard!"
            exit 0
            ;;
        *)
            echo "Opción no válida."
            sleep 1
            ;;
    esac
done
