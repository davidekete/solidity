contract C {
    function test() public pure returns (uint) {
        return erc7201(string(abi.encode(erc7201("x"))));
    }
}
// ----
// test() -> 0x3ddacd530df1b3f1d101f289e9884b99a95a7262096113832a69339fec406600
