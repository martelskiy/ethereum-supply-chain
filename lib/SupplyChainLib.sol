// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library SupplyChainLib {
    struct Product {
        string modelNumber;
        string partNumber;
        string serialNumber;
        address productOwner;
        uint32 cost;
        uint32 mfgTimeStamp;
    }
    struct Participant {
        string userName;
        string password;
        string participantType;
        address participantAddress;
    }
    struct Ownership {
        uint32 productId;
        uint32 ownerId;
        uint32 trxTimeStamp;
        address productOwner;
    }
}
