contract C {
    function f() public pure returns (string memory) {
        return "example.main";
    }
    function test() public pure returns (uint) {
        return erc7201(f());
    }
}
// ----
// test() -> 0x183a6125c38840424c4a85fa12bab2ab606c4b6d0e7cc73c0c06ba5300eab500
