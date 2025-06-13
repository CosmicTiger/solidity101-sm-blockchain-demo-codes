// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MiNFT - Un contrato NFT simplificado
contract MiNFT {
    /// @notice Total de tokens creados
    uint256 public totalTokens;

    /// @notice Mapeo que indica quién es dueño de qué token
    mapping(uint256 => address) public ownerOf;

    /// @notice Crea un nuevo NFT y lo asigna al remitente
    function mint() public {
        totalTokens++; // Incrementa el contador de NFTs
        ownerOf[totalTokens] = msg.sender; // Asigna el nuevo NFT al minter
    }

    /// @notice Devuelve todos los IDs de NFTs que posee el usuario
    /// @return Lista de IDs
    function getMyNFTs() public view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](totalTokens);
        uint count = 0;

        for (uint i = 1; i <= totalTokens; i++) {
            if (ownerOf[i] == msg.sender) {
                result[count] = i;
                count++;
            }
        }

        return result;
    }
}
