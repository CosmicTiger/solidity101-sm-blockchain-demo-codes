// --> Este apartado declara la licencia de código abierto y prosigue con
// la versión de Solidity que se utilizará.
// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

// Estas son otras maneras de hacer la declaración de la versión de Solidity
// Para disponer de cierta retrocompatibilidad, se puede utilizar la siguiente línea:
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    // Declara una variable pública de tipo uint256 (número entero sin signo de 256 bits) que representa el número favorito general del contrato.
    // Como no es public, no se genera automáticamente una función getter.
    uint256 myFavoriteNumber;

    // Define una estructura personalizada llamada Person que agrupa un número favorito con un nombre.
    // Suele ser una forma de agrupar datos relacionados y usualmente es lo más eficiente para contratos inteligentes.
    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    // La variable listOfPeople es un array dinámico de estructuras Person.
    Person[] public listOfPeople;

    // Define un mapping (tabla hash) que asocia un string (nombre) con su número favorito (uint256).
    // A su vez, se puede consultar directamente por nombre para obtener su número favorito.
    mapping(string => uint256) public nameToFavoriteNumber;

    // Esta función permite guardar un número favorito en myFavoriteNumber.
    // Dicho numero es un paremetro de entrada de la función de tipo uint256.
    // Corresponde aclarar que, public indica que puede ser llamada desde fuera del contrato.
    // Lo cual implica:
    // 🔗 Desde otros contratos
    // 🧑‍💻 Desde interfaces como una DApp en el frontend
    // 🔧 Desde herramientas como Remix, Foundry, Hardhat, o web3.js/ethers.js
    // 🔁 Desde dentro del mismo contrato
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // Esta función permite recuperar el número favorito almacenado en myFavoriteNumber.
    // En este caso, destaca la sentencia view returns la cual consiste en:
    // - view: indica que la función no modifica el estado del contrato.
    // - returns: indica el tipo de dato que se devolverá al llamar a la función.
    // - (uint256): el tipo de dato que se devolverá al llamar a la función.
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // Esta función permite agregar una nueva persona a la lista de personas.
    // La función toma dos parámetros: un string (nombre) y un uint256 (número favorito).
    // Almacena la nueva persona en el array listOfPeople y también actualiza el mapping nameToFavoriteNumber.
    // La función es pública, lo que significa que puede ser llamada desde fuera del contrato.
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
