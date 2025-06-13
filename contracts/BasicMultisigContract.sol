// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Multisig - Contrato simple que requiere aprobación de 2 dueños
contract Multisig {
    address public owner1;
    address public owner2;

    bool public confirmacion1;
    bool public confirmacion2;

    /// @notice Constructor: define a ambos propietarios
    /// @param _owner2 Dirección del segundo propietario
    constructor(address _owner2) {
        owner1 = msg.sender;
        owner2 = _owner2;
    }

    /// @notice Permite a cada dueño confirmar su aprobación
    function confirmar() public {
        require(msg.sender == owner1 || msg.sender == owner2, "No autorizado");

        if (msg.sender == owner1) {
            confirmacion1 = true;
        } else {
            confirmacion2 = true;
        }
    }

    /// @notice Ejecuta una acción solo si ambos confirmaron
    /// @return string Mensaje de éxito si ambos confirmaron
    function ejecutar() public view returns (string memory) {
        require(confirmacion1 && confirmacion2, "No confirmado por ambos");
        return "Accion ejecutada!";
    }
}
