/// match guard sample
/// binding value to variable in match guard


#[derive(Debug)]
enum Temp {
    Hot(i32),
}
fn main() {
    // match guard
    let temp = Temp::Hot(32);
    match temp {
        Temp::Hot(t) if t > 30 => println!("Hot"),
        _ => println!("Not hot"),
    }

    // binding value to variable 
    let temp = Temp::Hot(32);
    match temp {
        Temp::Hot(n @ 30) => println!("Hot: {}", n),
        _ => println!("Not hot"),
    }

    // Binding option value to variable
    let temp = Some(32);
    match temp {
        Some(n @ 30) => println!("Hot: {}", n),
        Some(n) => println!("Not hot: {}", n),
        _ => println!("None"),
    }
}
