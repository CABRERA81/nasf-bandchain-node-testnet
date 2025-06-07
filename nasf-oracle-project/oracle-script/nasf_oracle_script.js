if (!reports || reports.length === 0) {
  throw new Error("No hay reportes disponibles del Data Source.");
}

const result = reports[0].result;

// Validar que venga el campo esperado
if (!result.price_usd) {
  throw new Error("El campo 'price_usd' no está presente en el resultado.");
}

// Convertir a entero escalado (ej. 0.00605754 => 6057)
const priceInt = Math.round(result.price_usd * 1e6);

return {
  result: priceInt
};

