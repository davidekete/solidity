bytes constant bytesArg = "abcdef";
contract C {
    function f() public pure returns (uint256) {
        return erc7201(bytesArg);
    }
}
// ----
// TypeError 6896: (121-129): The argument to erc7201() builtin must be string. The supplied argument has type bytes.
