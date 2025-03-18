contract C {
    string constant storageLocation = "example.main";
    function test() public pure returns (bool) {
        return erc7201("example.main") == erc7201(storageLocation);
    }
}
// ----
// test() -> true
