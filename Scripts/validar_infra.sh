#!/bin/bash
echo "Iniciando prueba automatizada de validacion de infraestructura..."

if [ -f "infra/template.yaml" ]; then
  echo "[OK] El archivo infra/template.yaml existe."
else
  echo "[ERROR] No se encontro infra/template.yaml."
  exit 1
fi

if grep -q "AWS::EC2::VPC" "infra/template.yaml"; then
  echo "[OK] Recurso VPC validado correctamente en la plantilla."
else
  echo "[ERROR] No se encontro la definicion de VPC."
  exit 1
fi

echo "Todas las pruebas automatizadas finalizaron con exito."