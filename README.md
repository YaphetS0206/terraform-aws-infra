## 🚀 Terraform AWS Infrastructure (Modular & Scalable)

Infraestructura como código (IaC) en AWS utilizando Terraform, siguiendo buenas prácticas de modularización, automatización y gestión de entornos.

⸻

## 🧠 Descripción

Este proyecto implementa una arquitectura básica en AWS de forma modular, permitiendo desplegar recursos de manera reutilizable y escalable. Está orientado a simular un entorno real de trabajo en DevOps, incorporando conceptos como workspaces, automatización y uso de data sources.

⸻

## 🏗️ Arquitectura

La infraestructura desplegada incluye:
	•	VPC
	•	Subnet pública
	•	Instancia EC2

Se utiliza una AMI dinámica (Amazon Linux) obtenida mediante data sources, evitando valores hardcodeados.

⸻

## ⚙️ Tecnologías
	•	Terraform
	•	AWS (EC2, VPC, Subnet)
	•	Bash (automatización)
	•	Git & GitHub


## 🚀 ¿Cómo funciona?

El flujo del proyecto es:
	1.	Se define la infraestructura en módulos (VPC, Subnet, EC2)
	2.	Se parametriza el entorno (dev)
	3.	Se ejecuta un script que:
	•	Inicializa Terraform
	•	Crea o selecciona un workspace
	•	Ejecuta plan y apply
	4.	Terraform crea los recursos en AWS automáticamente


## 🔥 Características principales
	•	✔️ Infraestructura modular (reutilizable)
	•	✔️ Uso de Terraform Workspaces
	•	✔️ AMI dinámica (última versión de Amazon Linux)
	•	✔️ Script automatizado para despliegue
	•	✔️ Buenas prácticas de IaC

## ⚠️ Buenas prácticas aplicadas
	•	❌ No se usa el workspace default
	•	🔒 No se sube el archivo terraform.tfstate
	•	📦 Separación por entornos
	•	🔁 Uso de recursos dinámicos (AMI)

