// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

// import IERC721
// import IERC1155

uint8 constant NO_PFP = 0;
uint8 constant ERC721 = 1;
uint8 constant ERC1155 = 2;

struct Pfp {
    uint8 networkId;
    uint8 eip;
    address collection;
    uint256 id;
}

contract Web3me {

    error NoPfp();

    mapping ( address => Pfp ) private pfps;
    
    function setPfp(uint8 _networkId, uint8 _eip, address _collection, uint256 _id) external {
        pfps[msg.sender].networkId = _networkId;
        pfps[msg.sender].eip = _eip;
        pfps[msg.sender].collection = _collection;
        pfps[msg.sender].id = _id;
    }

    function pfp(address _addr) public returns (string memory) {
        Pfp storage _pfp = pfps[_addr];

        if ( _pfp.eip == NO_PFP ) revert NoPfp();

        if ( _pfp.eip == ERC721 ) {
            // if ( IERC721(_pfp.collection).ownerOf(_pfp.id) == _addr )
            //     return IERC721(_pfp.collection).tokenURI(_pfp.id);
        } else {

        }
        return '';
    }
}
