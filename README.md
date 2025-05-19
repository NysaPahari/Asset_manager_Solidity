This repository contains a Solidity-based implementation of an asset management smart contract. It was developed as part of the SimplyFI internship assignment, which originally involved Hyperledger Fabric.

Since I'm currently learning Fabric and Docker, this version demonstrates the core logic using Solidity on the Ethereum platform (via Remix IDE).

## Features

- Role-based access control using `Admin`, `Auditor`, and `User` roles
- Asset functions:
  - `createAsset`: Only Admin can create assets
  - `readAsset`: Auditors can view all assets; Users can view only their own
  - `updateAsset`: Owners can update their asset value
  - `deleteAsset`: Owners can delete their asset
- Simple structure, designed to reflect the logic of an ABAC-based permission model

## Technologies Used

- Solidity(version ^0.8.0)
- Remix IDE for testing and deployment

## Files

- `AssetManager.sol`: The smart contract file implementing the logic
