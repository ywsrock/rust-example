/// rust unit test is in the same file as the function
/// tests directory is used to itegrate all tests

use test_cmd::{add, sub};


fn main() {
    let r = add(1, 2);
    println!("r = {}", r);

    let r = sub(1, 2);
    println!("r = {}", r);
}


