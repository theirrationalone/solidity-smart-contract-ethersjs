////////////////
/// LICENSE ///
//////////////
// SPDX-License-Identifier: MIT

/////////////////
/// COMPILER ///
///////////////
pragma solidity ^0.8.8;

/////////////////
/// CONTRACT ///
///////////////
contract SimpleStorage {
    //////////////
    /// TYPES ///
    ////////////
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    ////////////////////////
    /// STATE VARIABLES ///
    //////////////////////
    People[] private s_people;
    mapping(string => uint256) private s_personNameToFavoriteNumber;
    uint256 private s_favoriteNumber;

    /////////////////////////////
    /// MUTATIONAL FUNCTIONS ///
    ///////////////////////////
    function store(uint256 _favoriteNumber) public {
        s_favoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        s_people.push(People(_favoriteNumber, _name));
        s_personNameToFavoriteNumber[_name] = _favoriteNumber;
    }

    /////////////////////////
    /// HELPER FUNCTIONS ///
    ///////////////////////
    function retrieve() public view returns (uint256) {
        return s_favoriteNumber;
    }

    function getPerson(uint256 _personIdx) public view returns (People memory) {
        return s_people[_personIdx];
    }

    function getFavoriteNumberOfPerson(
        string memory _name
    ) public view returns (uint256) {
        return s_personNameToFavoriteNumber[_name];
    }
}
