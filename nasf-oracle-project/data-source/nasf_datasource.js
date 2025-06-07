const res = await context.http.get(
  "https://api.coingecko.com/api/v3/simple/token_price/bnb-smart-chain?contract_addresses=0x7891d5f6c0eba5485d2fca5cc83b4c89a770f9a6&vs_currencies=usd"
);

const price = res.data["0x7891d5f6c0eba5485d2fca5cc83b4c89a770f9a6"]?.usd;

if (!price) {
  throw new Error("No se encontró el precio NASF en la API de CoinGecko.");
}

// Escalamos el precio a 1e8 para mantener precisión decimal
return {
  result: Math.floor(price * 1e8)
};

