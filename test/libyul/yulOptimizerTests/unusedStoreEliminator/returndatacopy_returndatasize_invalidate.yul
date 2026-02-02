{
    let s := returndatasize()
    pop(staticcall(gas(), 0x01, 0, 0, 0, 0))
    let s1 := returndatasize()
    returndatacopy(0, 0, s)
    returndatacopy(0, 0, s1)

    let c := returndatasize()
    pop(call(gas(), 0x01, 0, 0, 0, 0, 0))
    let c1 := returndatasize()
    returndatacopy(0, 0, c)
    returndatacopy(0, 0, c1)

    let d := returndatasize()
    pop(delegatecall(gas(), 0x01, 0, 0, 0, 0))
    let d1 := returndatasize()
    returndatacopy(0, 0, d)
    returndatacopy(0, 0, d1)
}
// ====
// EVMVersion: >homestead
// ----
// step: unusedStoreEliminator
//
// {
//     {
//         let s := returndatasize()
//         pop(staticcall(gas(), 0x01, 0, 0, 0, 0))
//         let s1 := returndatasize()
//         returndatacopy(0, 0, s)
//         let _10 := 0
//         let _11 := 0
//         let c := returndatasize()
//         pop(call(gas(), 0x01, 0, 0, 0, 0, 0))
//         let c1 := returndatasize()
//         returndatacopy(0, 0, c)
//         let _22 := 0
//         let _23 := 0
//         let d := returndatasize()
//         pop(delegatecall(gas(), 0x01, 0, 0, 0, 0))
//         let d1 := returndatasize()
//         returndatacopy(0, 0, d)
//         let _33 := 0
//         let _34 := 0
//     }
// }
