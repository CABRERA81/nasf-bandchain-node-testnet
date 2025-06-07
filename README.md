
---

## 🔧 Requisitos

- Nodo validando en la testnet **Laozi** de BandChain
- **Yoda** instalado y vinculado al nodo
- Executor desplegado en **AWS Lambda**
- API funcional (ej. [Elk Finance](https://app.elk.finance), CoinGecko) para consultar el precio de NASF
- SDK y herramientas de Band Protocol

---

## 📡 ¿Qué contiene?

### ✅ `band-node-setup/`
Archivos necesarios para correr un nodo en la testnet, incluyendo configuración personalizada y claves.

### ✅ `nasf-oracle-project/`
Contiene el **Oracle Script** (`.js` y `.wasm`) y el proceso de registro en BandChain para consultar precios externos.

### ✅ `nasf-executor/`
Función ejecutora que consume datos de una API (como ELK o CoinGecko), los valida, y responde al oráculo en tiempo real.

---

## 📜 Licencia

MIT – Puedes usar, modificar y distribuir este código libremente.  
Eso sí, **no vengas a llorar si lo rompes** 😎

---

## 🛰️ Más info

📍 Proyecto: [https://nashsmartfinance.io](https://nashsmartfinance.io)  
📬 Contacto: [@andyestrada](https://beacons.ai/andyestrada)  
🌐 Band Protocol: [https://bandprotocol.com](https://bandprotocol.com)

---

> *"Lo descentralizado no se mendiga. Se construye."*  
> – Nash Smart Finance 🧠

