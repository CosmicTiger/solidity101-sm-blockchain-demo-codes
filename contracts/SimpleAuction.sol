// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Subasta - Una subasta donde gana la mejor oferta
contract Subasta {
    /// @notice Dirección del mejor postor actual
    address public mejorPostor;

    /// @notice Valor de la mejor oferta actual
    uint public mejorOferta;

    /// @notice Permite ofertar y reemplazar la mejor oferta anterior
    function ofertar() public payable {
        require(msg.value > mejorOferta, "Oferta demasiado baja");

        // Reembolsar al postor anterior
        payable(mejorPostor).transfer(mejorOferta);

        // Actualizar datos con la nueva mejor oferta
        mejorPostor = msg.sender;
        mejorOferta = msg.value;
    }
}
