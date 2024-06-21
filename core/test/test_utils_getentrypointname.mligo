#import "../utils.mligo" "Utils"

module Counter = struct
  type storage = int

  type ret = operation list * storage

  [@entry]
  let increment (delta : int) (store : storage) : ret = [], store + delta

  [@entry]
  let decrement (delta : int) (store : storage) : ret = [], store - delta

  [@entry]
  let reset (() : unit) (_ : storage) : ret = [], 0
end


let test =
  let _test_get_entrypoint_name =
    // let user = Test.nth_bootstrap_account 1 in
    let orig = Test.Next.Originate.contract (contract_of Counter) 42 0tez in
    let contract = Test.Next.Typed_address.to_contract orig.taddr in
    let contract_address : address = Tezos.address contract in

    let verify_entrypoint_name (type a) (name: string) (ep: a contract option) : unit =
      match ep with
      | None -> failwith "[Test get_entrypoint_name] Unknown entrypoint"
      | Some ep -> Assert.assert (Utils.Entrypoint.get_entrypoint_name(ep) = name)
    in
    let ep_inc = (Tezos.get_entrypoint_opt "%increment" contract_address : int contract option) in
    let ep_dec = (Tezos.get_entrypoint_opt "%decrement" contract_address : int contract option) in
    let ep_res = (Tezos.get_entrypoint_opt "%reset" contract_address : unit contract option) in
    let () = verify_entrypoint_name "%increment" ep_inc in
    let () = verify_entrypoint_name "%decrement" ep_dec in
    let () = verify_entrypoint_name "%reset" ep_res in
    Test.Next.IO.log ("Test 'get_entrypoint_name' finished") in
    ()
