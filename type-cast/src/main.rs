// This program demonstrates the use of the `as` keyword to perform explicit type casting
// The `as` keyword is used to perform primitive type casting


#![allow(overflowing_literals)]

fn main() {
    let decimal = 65.4321_f32;

    // Error! No implicit conversion
    // let integer: u8 = decimal;

    // Explicit conversion
    let integer = decimal as u8;
    let character = integer as char;

    println!("Casting: {} -> {} -> {}", decimal, integer, character);

    // When casting any value to an unsigned type, T, T::MAX + 1 is added or subtracted until the value
    // fits into the new type
    println!("1000 as a u16 is: {}", 1000 as u16);

    // 1000 - 256 - 256 - 256 = 232
    // Under the hood, the first 8 least significant bits (LSB) are kept, while the rest towards the most
    // 1000 as binary is 11 1110 1000 less significant 8 bits are 1110 1000
    // 1110 1000 in decimal is 232
    println!("1000 as a u8 is: {}", 1000 as u8);

    // -1 + 256 = 255
    println!("-1 as a u8 is: {}", (-1i8) as u8);

    // For positive numbers, this is the same as the modulus
    println!("1000 mod 256 is: {}", 1000 % 256);

    // When casting to a signed type, the (bitwise) result is the same as first casting to the corresponding
    // unsigned type. If the most significant bit of that value is 1, then the value is negative
    println!("128 as a i16 is: {}", 128 as i16);
    println!("128 as a i8 is: {}", 128 as i8);

    // repeating the example above
    println!("1000 as a u8 is: {}", 1000 as u8);
    println!("232 as a i8 is: {}", 232 as i8);


    // Since Rust 1.45, the `as` keyword supports the `int` and `float` suffixes
    // which specify the size of the type to cast to
    // This is useful when the type of a variable is ambiguous
    // 300.0 as u8 is 255
    println!(" 300.0 as u8 is : {}", 300.0_f32 as u8);
    // -100.0 as u8 is 0
    println!("-100.0 as u8 is : {}", -100.0_f32 as u8);
    // nan as u8 is 0
    println!("   nan as u8 is : {}", f32::NAN as u8);

    // This behavior incurs a runtime cost and as such should be avoided where possible
    // If you need to cast to a type of a particular size, it's recommended to use the `to` method
    unsafe {
      // 300.0 as u8 is 44
        println!(" 300.0 as u8 is : {}", 300.0_f32.to_int_unchecked::<u8>());
        // -100.0 as u8 is 156
        println!("-100.0 as u8 is : {}", (-100.0_f32).to_int_unchecked::<u8>());
        // nan as u8 is 0
        println!("   nan as u8 is : {}", f32::NAN.to_int_unchecked::<u8>());
    }
}
