contract C {
    uint constant x = erc7201("main:example");
    uint[2 * x - x] array;
}
// ----
// TypeError 2643: (69-74): Arithmetic error when computing constant value.
