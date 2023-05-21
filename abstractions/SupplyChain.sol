// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ISupplyChain {
    event TransferOwnership(uint32 productId);

    function addParticipant(
        string memory _name,
        string memory _pass,
        address _pAdd,
        string memory _pType
    ) external returns (uint32);

    function getParticipant(
        uint32 _participant_id
    ) external view returns (string memory, address, string memory);

    function addProduct(
        uint32 _ownerId,
        string memory _modelNumber,
        string memory _partNumber,
        string memory _serialNumber,
        uint32 _productCost
    ) external returns (uint32);

    function getProduct(
        uint32 _productId
    )
        external
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint32,
            address,
            uint32
        );

    function newOwner(
        uint32 _user1Id,
        uint32 _user2Id,
        uint32 _prodId
    ) external returns (bool);

    function getProvenance(
        uint32 _prodId
    ) external view returns (uint32[] memory);

    function getOwnership(
        uint32 _regId
    ) external view returns (uint32, uint32, address, uint32);

    function authenticateParticipant(
        uint32 _uid,
        string memory _uname,
        string memory _pass,
        string memory _utype
    ) external view returns (bool);
}
