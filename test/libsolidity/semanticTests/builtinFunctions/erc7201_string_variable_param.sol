function erc7201Mock(string memory id) pure returns (uint256) {
    return uint256(
        keccak256(bytes.concat(bytes32(uint256(keccak256(bytes(id))) - 1))) &
        ~bytes32(uint256(0xff))
    );
}

string constant fileLevelStr = "test.file";
contract C {
    string constant stateVarStr = "example.contract";
    function fileLevel() public pure returns (uint256) {
        return erc7201(fileLevelStr);
    }
    function stateVar() public pure returns (uint256) {
        return erc7201(stateVarStr);
    }
    function localVar() public pure returns (uint256) {
        string memory localVarStr = "example.main";
        return erc7201(localVarStr);
    }
    function funcParam(string memory paramStr) public pure returns (uint256) {
        return erc7201(paramStr);
    }
}
// ----
// fileLevel() -> 0xb9461e024d489a6d2e292b5104cca62e43f3d7d69bd27bb9379bdec02a4b600
// stateVar() -> 0x3900f6bf9776dcf7feeb475cf1a84528427ce740b518e42c213bbb76e98e6700
// localVar() -> 0x183a6125c38840424c4a85fa12bab2ab606c4b6d0e7cc73c0c06ba5300eab500
// funcParam(string): 0x20, 12, "example.main" -> 0x183a6125c38840424c4a85fa12bab2ab606c4b6d0e7cc73c0c06ba5300eab500
