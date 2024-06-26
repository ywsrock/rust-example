/// This is a simple example of a Rust program.
/// suffixes are used to denote the type of the variable
/// such as i32 for 32-bit integer, f64 for 64-bit floating point number
/// suffixes not specified will default to i32 or f64

fn main() {
    // specify the type of the variable
    let x = 5i32;
    let y = 6f64;

    println!("x = {}", x);
    println!("y = {}", y);
    
    // do not specify the type of the variable
    let a = 5;
    let b = 6.0;
    println!("a = {}", a);
    println!("b = {}", b);


    // size of the variable in bytes(8 bits per byte)
    println!("size of x = {}", std::mem::size_of_val(&x));
    println!("size of y = {}", std::mem::size_of_val(&y));
    println!("size of a = {}", std::mem::size_of_val(&a));
    println!("size of b = {}", std::mem::size_of_val(&b));

    // type assertion
    
    let c = 5u8;
    // complier does not know the type of the variable:
    let mut vec = Vec::new();
    // now the complier knows the type of the variable is u8
    vec.push(c);
    println!("{:?}", vec);

    // type alias
    // alies naming convention is to use CamelCase
    type NanoSecond = u64;
    type Inch = u64;
    type U64 = u64;

    let nanoseconds: NanoSecond = 5 as U64;
    let inches: Inch = 2 as U64;

    println!("nanoseconds = {}, inches = {}", nanoseconds,inches);

}
