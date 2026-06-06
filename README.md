📦 backup.sh — Backup automático con fecha
¿Qué hace?

Comprime un directorio completo en un archivo .tar.gz y le añade la fecha y hora al nombre del fichero. Lo guarda en el destino que le indiques. Perfecto para programar con cron y tener copias de seguridad automáticas sin hacer nada a mano.
¿Por qué lo elegimos?

Hacer backups manualmente es lento y fácil de olvidar. En las FCT vimos cómo los sysadmin pierden tiempo en esto cada semana. Con este script se automatiza en una línea.
Cómo se usa

bash
chmod +x backup.sh
./backup.sh /ruta/origen /ruta/destino

Ejemplo:

bash
./backup.sh /var/www /backups
# Resultado → /backups/backup_www_2026-06-05_18-30-00.tar.gz

Qué aprendimos

Cómo construir nombres de fichero dinámicos con $(date ...) y comprimir directorios con tar -czf usando rutas relativas para que el backup quede limpio por dentro.
Posibles mejoras

    Enviar notificación por email o Slack al terminar

    Borrar automáticamente backups con más de N días

    Comprobar el espacio en disco antes de comprimir

🗑️ limpiar_logs.sh — Limpiador de logs antiguos
¿Qué hace?

Busca todos los ficheros .log en un directorio que tengan más de X días de antigüedad, los lista por pantalla y, tras pedir confirmación al usuario, los elimina. Evita que el disco se llene sin que nadie se dé cuenta.
¿Por qué lo elegimos?

En servidores de producción los logs pueden ocupar decenas de gigas en pocas semanas. Este script lo convierte en una tarea segura y controlada: primero muestra lo que va a borrar y luego pide confirmación.
Cómo se usa

bash
chmod +x limpiar_logs.sh
./limpiar_logs.sh /ruta/logs <dias>

Ejemplo:

bash
./limpiar_logs.sh /var/log/apache2 30
# Muestra los logs con más de 30 días y pide confirmación antes de borrar

Qué aprendimos

El comando find con -mtime +N para filtrar ficheros por antigüedad, y cómo añadir un paso de confirmación interactiva con read para que el script no borre nada por accidente.
Posibles mejoras

    Opción --dry-run para simular sin borrar nada

    Registrar los ficheros eliminados en un log de auditoría

    Comprimir en vez de eliminar (archivado histórico)

Requisitos

    Sistema operativo: Linux / macOS

    Shell: Bash

Autores

Jorge Ciordia , Alejandro Arellano · ADSO 2º ASI · CI Estella · 2025-2026
