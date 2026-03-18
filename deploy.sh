#!/bin/bash
set -e

ENV=$1
WORKSPACE=$2

# -------------------------
# Validación de argumentos
# -------------------------
if [ -z "$ENV" ] || [ -z "$WORKSPACE" ]; then
  echo "❌ Uso correcto: ./deploy.sh <env> <workspace>"
  echo "Ejemplo: ./deploy.sh dev dev"
  exit 1
fi

if [ "$WORKSPACE" == "default" ]; then
  echo "❌ No está permitido usar el workspace 'default'"
  exit 1
fi

echo "🚀 Ambiente: $ENV"
echo "📦 Workspace: $WORKSPACE"

cd environments/$ENV || { echo "❌ Ambiente no existe"; exit 1; }

# -------------------------
# Crear Key Pair si no existe
# -------------------------
KEY_NAME="${WORKSPACE}-key"
KEY_FILE="${KEY_NAME}.pem"

if ! aws ec2 describe-key-pairs --key-names "$KEY_NAME" &>/dev/null; then
  echo "🔑 Key pair '$KEY_NAME' no existe, creando..."
  aws ec2 create-key-pair \
    --key-name "$KEY_NAME" \
    --query 'KeyMaterial' \
    --output text > "$KEY_FILE"
  chmod 400 "$KEY_FILE"
  echo "✅ Key pair '$KEY_NAME' creada y guardada en '$KEY_FILE'"
else
  echo "🔑 Key pair '$KEY_NAME' ya existe, usando existente"
fi

# -------------------------
# Inicializar Terraform
# -------------------------
echo "🔧 Inicializando Terraform..."
terraform init

echo "📦 Seleccionando/creando workspace..."
if terraform workspace list | grep -q "$WORKSPACE"; then
  terraform workspace select "$WORKSPACE"
else
  terraform workspace new "$WORKSPACE"
fi

# -------------------------
# Validar y aplicar Terraform
# -------------------------
echo "📋 Validando..."
terraform validate

echo "🧪 Planificando..."
terraform plan -out=tfplan -var="key_name=$KEY_NAME"

echo "⚡ Aplicando..."
terraform apply -auto-approve tfplan

echo "✅ Deploy completado en $ENV ($WORKSPACE)"
echo "🔑 Puedes conectarte vía SSH con: ssh -i $KEY_FILE ec2-user@<TU-IP-PUBLICA>"