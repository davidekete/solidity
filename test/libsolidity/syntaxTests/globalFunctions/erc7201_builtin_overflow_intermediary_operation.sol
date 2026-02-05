contract C {
    uint constant d = 2**256 - 1 - erc7201("main:example");
    uint[erc7201("main:example") + d + 1 - 2] array;
}
// ----
// TypeError 2643: (82-113): Arithmetic error when computing constant value.
