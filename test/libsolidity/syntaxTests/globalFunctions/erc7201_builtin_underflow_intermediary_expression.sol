contract C {
    uint[10 - erc7201("main.example") + erc7201("main.example")] array;
}
// ----
// TypeError 2643: (22-50): Arithmetic error when computing constant value.
