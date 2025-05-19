// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetManager {
    enum Role { None, Admin, Auditor, User }

    struct Asset {
        string id;
        address owner;
        uint256 value;
    }

    mapping(string => Asset) private assets;
    mapping(address => Role) public roles;

    constructor() {
        roles[msg.sender] = Role.Admin;
    }

    modifier onlyAdmin() {
        require(roles[msg.sender] == Role.Admin, "Not an admin");
        _;
    }

    modifier onlyAuditor() {
        require(roles[msg.sender] == Role.Auditor, "Not an auditor");
        _;
    }

    modifier onlyOwner(string memory assetId) {
        require(assets[assetId].owner == msg.sender, "Not your asset");
        _;
    }

    function assignRole(address user, Role role) public onlyAdmin {
        roles[user] = role;
    }

    function createAsset(string memory id, uint256 value) public onlyAdmin {
        require(assets[id].owner == address(0), "Asset already exists");
        assets[id] = Asset(id, msg.sender, value);
    }

    function readAsset(string memory id) public view returns (Asset memory) {
        require(
            roles[msg.sender] == Role.Auditor ||
            assets[id].owner == msg.sender,
            "Access denied"
        );
        return assets[id];
    }

    function updateAsset(string memory id, uint256 newValue) public onlyOwner(id) {
        assets[id].value = newValue;
    }

    function deleteAsset(string memory id) public onlyOwner(id) {
        delete assets[id];
    }
}
