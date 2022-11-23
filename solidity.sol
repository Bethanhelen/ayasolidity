// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract BasicsOfSolidity {

    // CONSTANT AND IMMUTABLE

    string constant public owner = "Elizabeth Olusipe";

    address payable immutable public owner2;

    constructor(address payable _addr) {
        owner2 = _addr;
    }

    address payable owner3 = payable(0x25E97C494964F17180D0bf4676Eb66bAa2dBc2d6);

    function sendEther() public payable {
        owner3.transfer(msg.value);
    }
     function acceptEther() public payable returns(uint){
        return msg.value;
    }

     event Paid (
        uint amount,
        uint time
    );

    function pay() external payable {
        emit Paid(msg.value, block.timestamp);
    }

    modifier onlyOwner(){
        require(msg.sender == owner3, "Not owner");
        _;
    }
}
