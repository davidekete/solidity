bytes constant b = abi.encodePacked(bytes32(uint256(2)));
contract C {
    function f() public pure returns (uint256) {
        uint256 x = erc7201(b);
        return x;
    }
}
// ----
// TypeError 6896: (148-149): The argument to erc7201() builtin must be string. The supplied argument has type bytes.
