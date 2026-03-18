#!/bin/bash

set -e

ENV=$1
WORKSPACE=$2

# Validación de argumentos
if [ -z "$ENV" ] || [ -z "$WORKSPACE" ]; then
  echo "❌ Uso correcto: ./deploy.sh <env> <workspace>"
  echo "Ejemplo: ./deploy.sh dev feature-login o algo parecido"
  exit 1
fi

# Evitar uso de default explícitamente
if [ "$WORKSPACE" == "default" ]; then
  echo "❌ No está permitido usar el workspace 'default'"
  exit 1
fi

echo "🚀 Ambiente: $ENV"
echo "📦 Workspace: $WORKSPACE"

cd environments/$ENV || { echo "❌ Ambiente no existe"; exit 1; }

echo "🔧 Inicializando Terraform..."
terraform init

echo "📦 Seleccionando/creando workspace..."

# Si existe lo usa, si no lo crea
if terraform workspace list | grep -q "$WORKSPACE"; then
  terraform workspace select "$WORKSPACE"
else
  terraform workspace new "$WORKSPACE"
fi

echo "📋 Validando..."
terraform validate

echo "🧪 Planificando..."
terraform plan -out=tfplan

echo "⚡ Aplicando..."
terraform apply -auto-approve tfplan

echo "✅ Deploy completado en $ENV ($WORKSPACE)"