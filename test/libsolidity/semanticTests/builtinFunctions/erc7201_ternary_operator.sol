function erc7201Mock(string memory id) pure returns (uint256) {
    return uint256(
        keccak256(bytes.concat(bytes32(uint256(keccak256(bytes(id))) - 1))) &
        ~bytes32(uint256(0xff))
    );
}

contract C {
    function simple() public pure returns (uint) {
        return erc7201(true ? "x" : "y");
    }
    function compounded(bool c1, bool c2) public pure returns (uint) {
        return erc7201(c1 ? "a" : (c2 ? "x" : "c"));
    }
}
// ----
// simple() -> 0x87b4891dabfa6386a559a842738ea7cea3c9f195f3e5e60ccbd5b6d66c3b5000
// compounded(bool,bool): false, true -> 0x87b4891dabfa6386a559a842738ea7cea3c9f195f3e5e60ccbd5b6d66c3b5000
