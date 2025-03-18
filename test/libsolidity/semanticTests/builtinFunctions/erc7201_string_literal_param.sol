function erc7201Mock(string memory id) pure returns (uint256) {
    return uint256(
        keccak256(bytes.concat(bytes32(uint256(keccak256(bytes(id))) - 1))) &
        ~bytes32(uint256(0xff))
    );
}

contract C {
    function stringLiteral() public pure returns (uint) {
        return erc7201("example.main");
    }
    function emptyString() public pure returns (uint) {
        return erc7201("");
    }
    function testEquivalence() public pure returns (bool) {
        return
            erc7201("") == erc7201Mock("") &&
            erc7201("example.main") == erc7201Mock("example.main");
    }
}
// ----
// stringLiteral() -> 0x183a6125c38840424c4a85fa12bab2ab606c4b6d0e7cc73c0c06ba5300eab500
// emptyString() -> 0x4318a0031e4d2f411be9017543511db04d79cf580aaff6bae7539a4a49eacc00
// testEquivalence() -> true
