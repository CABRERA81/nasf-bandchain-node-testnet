// relayer/updateNASFPrice.js
const axios = require("axios");
const Web3 = require("web3");
require("dotenv").config();

const web3 = new Web3(process.env.BSC_RPC);
const contractABI = [
  {
    "inputs": [{"internalType":"uint256","name":"_price","type":"uint256"}],
    "name":"updatePrice",
    "outputs":[],
    "stateMutability":"nonpayable",
    "type":"function"
  },
  {
    "inputs":[],
    "name":"getPrice",
    "outputs":[{"internalType":"uint256","name":"","type":"uint256"}],
    "stateMutability":"view",
    "type":"function"
  }
];

const contract = new web3.eth.Contract(contractABI, process.env.CONTRACT_ADDRESS);

async function main() {
  try {
    const res = await axios.get(`https://laozi-testnet.bandchain.org/api/oracle/request/${process.env.BAND_REQUEST_ID}`);
    const bandResult = res.data.result;

    if (!bandResult || !bandResult.response || !bandResult.response.result) {
      throw new Error("❌ No se encontró resultado del oráculo en BandChain");
    }

    const nasfPrice = parseInt(bandResult.response.result);

    const account = web3.eth.accounts.privateKeyToAccount(process.env.PRIVATE_KEY);
    const tx = contract.methods.updatePrice(nasfPrice);

    const txData = {
      to: process.env.CONTRACT_ADDRESS,
      data: tx.encodeABI(),
      gas: 100000,
    };

    const signed = await account.signTransaction(txData);
    const receipt = await web3.eth.sendSignedTransaction(signed.rawTransaction);

    console.log("✅ Precio actualizado:", nasfPrice / 1e8, "USD");
    console.log("🚀 TX Hash:", receipt.transactionHash);
  } catch (err) {
    console.error("❌ Error:", err.message);
  }
}

main();
