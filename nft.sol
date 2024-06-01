// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract MyNFT is ERC721{

    using Strings for uint256;

    address owner;
    uint256 public maxSupply = 10; // 最大發行量

    uint256 public counter = 0;

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    constructor (string memory _name, string memory _symbol) ERC721(_name, _symbol){
        owner = msg.sender;
    }

    
    //設定NFT的baseURI(盲盒)
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmRiUN2ki4upgTsyKn3D3CUbxPJFrfPhYmbETehh323hyT/";
    }
    
    //查看NFT Metadata網址
    //function tokenURI(uint256 tokenId) public pure override returns (string memory) {
    //    return _baseURI();
    //    
    //}

    // 實作mint function，主要用來demo確認用
    function mint (uint256 amount) external{
        require(amount + counter <= maxSupply, "over max supply.");
        // 迴圈批量鑄造NFT
        for(uint256 i=0; i < amount ; i++){
                // 鑄造 NFT, counter為NFT的tokenId
                _mint(msg.sender, counter);
                counter ++ ;
        }
    }

}