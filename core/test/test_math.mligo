#import "../math.mligo" "Math"
let test =
  let _test_isqrt =
    let () = Assert.assert (Math.isqrt (4n) = 2n) in
    let () = Assert.assert (Math.isqrt (8n) = 2n) in
    let () = Assert.assert (Math.isqrt (9n) = 3n) in
    let () = Assert.assert (Math.isqrt (15n) = 3n) in
    let () = Assert.assert (Math.isqrt (16n) = 4n) in
    let () = Assert.assert (Math.isqrt (17n) = 4n) in
    Test.Next.IO.log ("Test 'isqrt' finished") in
  let _test_factorial =
    let () = Assert.assert (Math.factorial (0n) = 1n) in
    let () = Assert.assert (Math.factorial (1n) = 1n) in
    let () = Assert.assert (Math.factorial (2n) = 2n) in
    let () = Assert.assert (Math.factorial (3n) = 6n) in
    let () = Assert.assert (Math.factorial (4n) = 24n) in
    let () = Assert.assert (Math.factorial (5n) = 120n) in
    let () = Assert.assert (Math.factorial (6n) = 720n) in
    Test.Next.IO.log ("Test 'factorial' finished") in
  ()
