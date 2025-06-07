# NASF Relayer
Relayer para actualizar el precio del token NASF en la red BNB Chain utilizando BandChain como fuente de datos oraculares.

## 📦 Estructura
- `/data-source` → Script que consulta la API de Elk.Finance
- `/oracle-script` → Script que procesa el precio recibido
- `/requests` → Script para lanzar solicitudes a BandChain
- `/relayer` → Bot para actualizar el precio en el contrato de BNB Chain
- `/contract` → Smart contract en Solidity que almacena el precio NASF

## ⚙️ Instalación
```bash
cd relayer/
npm install
