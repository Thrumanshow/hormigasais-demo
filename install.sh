#!/usr/bin/env bash
# HormigasAIS Demo — install.sh
# Prepara permisos y estructura para el reto de auditoria LBH

set -Eeuo pipefail

echo "🐜 HormigasAIS Demo — Instalacion"
echo "===================================="

# 1. Dar permisos de ejecucion a los scripts del demo
chmod +x gatekeeper.sh portal_auditor.sh portal_estudiante.sh
echo "✅ Permisos de ejecucion asignados (gatekeeper.sh, portal_auditor.sh, portal_estudiante.sh)"

# 2. Verificar que demo_state.json existe (usado por el portal Estudiante)
if [ -f demo_state.json ]; then
  echo "✅ demo_state.json encontrado"
else
  echo "⚠️  demo_state.json no encontrado — el portal Estudiante podria fallar"
fi

# 3. Crear secrets.conf de ejemplo si no existe (nunca se versiona, ver .gitignore)
if [ ! -f secrets.conf ]; then
  cat > secrets.conf << 'EOF'
# HormigasAIS Demo — secrets.conf
# Este archivo NO se sube a git (ver .gitignore).
# Define aqui tus propios tokens de prueba para el reto.

TOKEN_ADMIN="CAMBIA_ESTE_VALOR"
TOKEN_AUDITOR="AUDITOR_TEST_KEY_2026"
TOKEN_ESTUDIANTE="CAMBIA_ESTE_VALOR"
EOF
  echo "✅ secrets.conf creado con valores de ejemplo (edítalo antes de usar)"
else
  echo "ℹ️  secrets.conf ya existe, no se sobrescribe"
fi

echo "===================================="
echo "✅ Instalacion completada. Siguiente paso:"
echo "   ./portal_auditor.sh      (rol Auditor)"
echo "   ./portal_estudiante.sh   (rol Estudiante)"
