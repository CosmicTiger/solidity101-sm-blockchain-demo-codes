// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title DAO - Contrato de votación simple para una DAO
contract DAO {
    /// @notice Guarda si una dirección ya ha votado
    mapping(address => bool) public haVotado;

    /// @notice Contador de votos a favor
    uint public votosAFavor;

    /// @notice Contador de votos en contra
    uint public votosEnContra;

    /// @notice Permite votar una sola vez por usuario
    /// @param aFavor Indica si el voto es a favor o en contra
    function votar(bool aFavor) public {
        require(!haVotado[msg.sender], "Ya votaste");

        haVotado[msg.sender] = true;

        if (aFavor) {
            votosAFavor++;
        } else {
            votosEnContra++;
        }
    }
}
