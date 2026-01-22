# 🔍 Auto-OSINT-Tool v2.0 by Richard-CyberSec

Herramienta avanzada de automatización para investigaciones OSINT. Optimizada para Kali Linux, esta suite permite centralizar la búsqueda de identidades y rastros digitales en un solo lugar.

## 🌟 Nuevas Funcionalidades
- **Integración con Sherlock:** Búsqueda automatizada en más de 400 redes sociales.
- **Menú Interactivo:** Interfaz mejorada para una navegación rápida entre módulos.
- **Gestión de Evidencias:** Creación automática de carpetas por investigación para organizar resultados.
- **Registro de Auditoría (Logs):** Historial detallado de todas las búsquedas realizadas con marca de tiempo.
- **Seguridad en Navegación:** Ejecución de navegador forzada como usuario no-root para mayor estabilidad.

## 🛠️ Requisitos e Instalación
```bash
# Instalar Sherlock (necesario para la opción 2)
sudo apt update && sudo apt install sherlock -y

# Clonar y ejecutar
chmod +x Auto_OSINT.sh
sudo ./Auto_OSINT.sh
