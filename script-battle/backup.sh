#!/bin/bash
# =============================================================
# backup.sh — Backup automático de un directorio con fecha
# Uso: ./backup.sh <directorio_origen> <directorio_destino>
# =============================================================

if [ "$#" -ne 2 ]; then
    echo "❌  Uso: $0 <origen> <destino>"
    exit 1
fi

ORIGEN="$1"
DESTINO="$2"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
NOMBRE_BACKUP="backup_$(basename "$ORIGEN")_$FECHA.tar.gz"

if [ ! -d "$ORIGEN" ]; then
    echo "❌  El directorio de origen '$ORIGEN' no existe."
    exit 1
fi

mkdir -p "$DESTINO"

echo "📦  Creando backup de '$ORIGEN'..."
tar -czf "$DESTINO/$NOMBRE_BACKUP" -C "$(dirname "$ORIGEN")" "$(basename "$ORIGEN")"

if [ $? -eq 0 ]; then
    TAMANIO=$(du -sh "$DESTINO/$NOMBRE_BACKUP" | cut -f1)
    echo "✅  Backup creado: $DESTINO/$NOMBRE_BACKUP ($TAMANIO)"
else
    echo "❌  Error al crear el backup."
    exit 1
fi
