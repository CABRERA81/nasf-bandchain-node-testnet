const https = require("https");

exports.handler = async (event) => {
  try {
    const url = "https://api.coingecko.com/api/v3/simple/token_price/binance-smart-chain?contract_addresses=0x7891d5f6c0eba5485d2fca5cc83b4c89a770f9a6&vs_currencies=usd";

    const price = await new Promise((resolve, reject) => {
      https.get(url, (res) => {
        let data = "";

        res.on("data", (chunk) => {
          data += chunk;
        });

        res.on("end", () => {
          try {
            const json = JSON.parse(data);
            const price = json["0x7891d5f6c0eba5485d2fca5cc83b4c89a770f9a6"]?.usd;
            resolve(price);
          } catch (e) {
            reject(e);
          }
        });
      }).on("error", (err) => {
        reject(err);
      });
    });

    if (!price) {
      throw new Error("No se encontró el precio de NASF");
    }

    // Formato que espera Yoda: codificado en base64
    const payload = {
      price_usd: price
    };

    const base64 = Buffer.from(JSON.stringify(payload)).toString("base64");

    return {
      statusCode: 200,
      body: JSON.stringify({
        responses: [
          {
            result: {
              value: base64,
              pub_key: "placeholder_pubkey",
              signature: "placeholder_signature"
            }
          }
        ]
      })
    };
  } catch (err) {
    console.error("❌ Error al obtener el precio:", err.message);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: "No se pudo obtener el precio de NASF" })
    };
  }
};

