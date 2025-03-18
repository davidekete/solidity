contract C {
    uint constant x = erc7201("main:example");
    function f() public pure returns (uint) {
        return 2 * x - x;
    }
}
// ----
// f() -> FAILURE, hex"4e487b71", 0x11
