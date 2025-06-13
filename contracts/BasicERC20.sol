// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MiToken - Un token ERC20 básico de ejemplo
contract MiToken {
    /// @notice Nombre del token
    string public name = "MiToken";

    /// @notice Símbolo del token
    string public symbol = "MTK";

    /// @notice Decimales que usa el token (por convención 18)
    uint8 public decimals = 18;

    /// @notice Suministro total del token
    uint256 public totalSupply;

    /// @notice Mapeo de balances por dirección
    mapping(address => uint256) public balances;

    /// @notice Constructor: asigna todo el suministro inicial al creador del contrato
    constructor() {
        totalSupply = 1000000 * (10 ** decimals); // 1 millón de tokens
        balances[msg.sender] = totalSupply;
    }

    /// @notice Transfiere tokens a otra dirección
    /// @param to Dirección de destino
    /// @param amount Cantidad de tokens a transferir
    /// @return bool Indica si la transferencia fue exitosa
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Fondos insuficientes");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        return true;
    }
}
