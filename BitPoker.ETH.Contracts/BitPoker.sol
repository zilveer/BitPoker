pragma solidity ^0.4.8;

//ERC20 token for the in game chip of BitPoker.io
contract Chip {
    /* Public variables of the token */
    string public standard = "Chip 0.1";
    string public name = "BitPoker.io Chip";
    string public symbol;
    string public contractUrl = "https://www.bitpoker.io/contract";
    uint8 public decimals = 4;
    uint256 public totalSupply = 10000000;

    /* This creates an array with all balances */
    mapping (address=>uint) public balanceOf;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* Send chips */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}

//ICO contract
contract Cashier is Chip {
    uint256 public startDate;

    function Cashier()
    {
        startDate = now;
    }

    function buy() payable {
        //Sliding scale of ICO
        uint amount = 1;
        
        // if (now < startDate + 30 days)
        // {
        //     amount += msg.value * 1000;
        // }
        // else
        // {
        //     amount += msg.value * 500;
        // }
        
        amount += msg.value * 1000;
        balanceOf[msg.sender] += amount;
    }
}