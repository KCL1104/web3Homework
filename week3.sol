// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Example is ERC20 {

    // 定義最大供給量
    uint256 public maxSupply;

    //建構子初始化ERC20必要參數(name與symbol)，並多加設定題目要求的maxSupply
    constructor(
        string memory _name, 
        string memory _symbol,
        uint256 _maxSupply
        ) ERC20(_name, _symbol){
        //執行時填入10000000000(100億) * 1000000000000000000(單位)
        maxSupply = _maxSupply;
    }

    // 實作mint function，主要用來demo確認用
    function mint (uint256 amount) external {
        //判斷這筆交易若完成，是否會超出最大供給量，如果會就回傳錯誤字串"over max supply."
        require(amount + totalSupply() <= maxSupply, "over max supply.");
        _mint(msg.sender, amount);
    }
}