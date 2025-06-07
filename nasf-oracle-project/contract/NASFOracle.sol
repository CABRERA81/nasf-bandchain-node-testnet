// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NASFOracle {
    address public updater;
    uint256 public lastUpdated;
    uint256 public priceNASF; // Precio de NASF en dólares, escalado a 1e8 (por ejemplo, 0.0059 USD → 590000)

    event PriceUpdated(uint256 price, uint256 timestamp);
    event UpdaterChanged(address indexed previousUpdater, address indexed newUpdater);

    constructor() {
        updater = msg.sender;
    }

    modifier onlyUpdater() {
        require(msg.sender == updater, "No autorizado");
        _;
    }

    function updatePrice(uint256 _price) external onlyUpdater {
        require(_price > 0, "Precio inválido");

        priceNASF = _price;
        lastUpdated = block.timestamp;

        emit PriceUpdated(_price, block.timestamp);
    }

    function getPrice() external view returns (uint256) {
        require(priceNASF > 0, "Precio no disponible");
        return priceNASF;
    }

    function getLastUpdated() external view returns (uint256) {
        return lastUpdated;
    }

    function setUpdater(address _newUpdater) external onlyUpdater {
        require(_newUpdater != address(0), "Direccion no valida");

        address oldUpdater = updater;
        updater = _newUpdater;

        emit UpdaterChanged(oldUpdater, _newUpdater);
    }
}

