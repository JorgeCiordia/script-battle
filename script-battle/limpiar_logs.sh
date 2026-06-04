#!/bin/bash
# =============================================================
# limpiar_logs.sh — Elimina ficheros .log con más de X días
# Uso: ./limpiar_logs.sh <directorio_logs> <dias>
# =============================================================

if [ "$#" -ne 2 ]; then
    echo "❌  Uso: $0 <directorio_logs> <días>"
    exit 1
fi

DIR_LOGS="$1"
DIAS="$2"

if [ ! -d "$DIR_LOGS" ]; then
    echo "❌  El directorio '$DIR_LOGS' no existe."
    exit 1
fi

echo "🔍  Buscando ficheros .log con más de $DIAS días en '$DIR_LOGS'..."
LOGS_VIEJOS=$(find "$DIR_LOGS" -name "*.log" -type f -mtime +"$DIAS")

if [ -z "$LOGS_VIEJOS" ]; then
    echo "✅  No hay logs con más de $DIAS días. Nada que limpiar."
    exit 0
fi

echo "$LOGS_VIEJOS"
echo ""
read -p "⚠️  ¿Eliminar estos ficheros? [s/N]: " CONFIRMAR

if [[ "$CONFIRMAR" =~ ^[sS]$ ]]; then
    find "$DIR_LOGS" -name "*.log" -type f -mtime +"$DIAS" -delete
    echo "🗑️  Logs eliminados correctamente."
else
    echo "❌  Operación cancelada."
fi
