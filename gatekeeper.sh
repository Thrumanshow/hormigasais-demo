#!/bin/bash

# 🛡️ PORTERO LBH: Capa de Gobernanza Multinivel
TOKEN_ADMIN="ADMIN_MASTER_KEY_2026_XOXO"
TOKEN_AUDITOR="AUDITOR_TEST_KEY_2026"
TOKEN_ESTUDIANTE="ESTUDIANTE_LAB_2026"

echo "🤖 Portero LBH: Identificándose..."
read -s -p "Ingrese Token de Acceso: " INPUT_TOKEN
echo ""

# 👑 ACCESO ADMINISTRADOR
if [ "$INPUT_TOKEN" == "$TOKEN_ADMIN" ]; then
    echo "👑 ACCESO ADMINISTRADOR: Control total sobre el nodo."
    ./admin_tools.sh 

# 🔍 ACCESO AUDITOR
elif [ "$INPUT_TOKEN" == "$TOKEN_AUDITOR" ]; then
    echo "🔍 ACCESO AUDITOR: Acceso limitado a la Zona de Pruebas."
    curl -X POST http://127.0.0.1:8100/feromona \
      -H "Content-Type: application/json" \
      -d '{"nodo": "AUDITOR_EXTERNO", "payload": "LBH://VALIDACION_AUDITOR", "firma": "validada"}'
      
# 🎓 ACCESO ESTUDIANTE
elif [ "$INPUT_TOKEN" == "$TOKEN_ESTUDIANTE" ]; then
    echo "🎓 ACCESO ESTUDIANTE: Exploración educativa iniciada."
    # El estudiante puede ver el estado actual, pero no enviar feromonas
    echo "Leyendo estado actual de la colonia..."
    cat ~/hormigasais-lab/lbh-node-service/demo_state.json
    echo -e "\n\n🏁 Sesión educativa finalizada."

else
    echo "❌ ACCESO DENEGADO: Credenciales inválidas. Intrusión registrada."
    exit 1
fi
