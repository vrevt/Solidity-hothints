// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Merkle tree
    

contract Tree {
    bytes32[] public hashes;
    string[4] transactions = [
        "tx1: u1 -> u2",
        "tx2: u2 -> u1",
        "tx2: u3 -> u4",
        "tx4: u4 -> u1"
    ];
    
    constructor() {
        for (uint i = 0; i < transactions.length; i++){
            hashes.push(makeHash(transactions[i]));
        }

        uint count = transactions.length;
        uint offset = 0; 

        while (count > 0){
            for (uint i = 0; i < count - 1; i += 2){
                hashes.push(keccak256(abi.encodePacked(
                    hashes[offset + i], hashes[offset + i + 1]
                )));
            }
            offset += count;
            count /= 2;
        }
    }

    function verify(string memory transaction, uint index, bytes32 root, bytes32[] memory proof) public pure returns(bool){
        bytes32 hash = makeHash(transaction);
        for (uint i = 0; i < proof.length; i++){
            bytes32 element = proof[i];
            if (index % 2 == 0){
                hash = keccak256(abi.encodePacked(hash, element));
            } else {
                hash = keccak256(abi.encodePacked(element, hash));
            }
            index /= 2;
        }
        return hash == root;
    }

    function encode(string memory input) public pure returns(bytes memory) {
        return abi.encodePacked(input);
    }

    function makeHash(string memory input) public pure returns(bytes32) {
        return keccak256(
            encode(input)
        );
    }
}
