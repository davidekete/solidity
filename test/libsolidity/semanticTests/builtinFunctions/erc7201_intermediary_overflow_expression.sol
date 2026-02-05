contract C {
    uint constant d = 2**256 - 1 - erc7201("main:example");
    function f() public pure returns (uint) {
        return erc7201("main:example") + d + 1 - 2;
    }
}
// ----
// f() -> FAILURE, hex"4e487b71", 0x11
