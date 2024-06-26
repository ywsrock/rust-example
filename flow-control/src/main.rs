/// rust flow control
/// if else
/// loop
/// while
/// for..in(Iterator)
/// match
/// if let
/// while let
/// for let
/// break
/// continue
/// label
fn main() {
    let int = 5;

    ///////////////////////////////// if else //////////////////////////////////
    if int < 10 {
        println!("Less than 10");
    } else {
        println!("Greater than or equal to 10");
    }

    // variable binding must be same type and same scope
    // and must end with 「;」 if it is an expression
    let g_int = if int < 10 { 10 } else { 20 };

    ///////////////////////////////// loop //////////////////////////////////
    // loop is an infinite loop
    // break is used to exit the loop
    // continue is used to skip the current iteration

    let mut counter = 0;
    loop {
        counter += 1;

        if counter % 3 == 0 {
            println!("Even number: {}", counter);
            continue;
        }

        if counter == 10 {
            println!("Counter is 10");
            break;
        }
    }

    // label is used to break or continue a specific loop
    // break 'label_name;
    // continue 'label_name;A
    #[allow(unreachable_code)]
    'outer: loop {
        println!("Entered the outer loop");

        'inner: loop {
            println!("Entered the inner loop");

            // This would break only the inner loop
            // これは内側のループのみを中断します。
            //break;

            // This breaks the outer loop
            // こちらは外側を中断します
            break 'outer;
            println!("This point will never be reached");
        }

        println!("Exited the outer loop");
    }

    // loop  return value
    // break value;
    let mut counter = 0;
    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    /////////////////////////////// while //////////////////////////////////
    // while is used to loop until a condition is met
    // odd even number
    let mut number = 0;

    while number < 10 {
        if number % 2 == 0 {
            println!("Even number: {}", number);
        } else {
            println!("Odd number: {}", number);
        }

        number += 1;
    }

    ///////////////////////////////// for //////////////////////////////////
    // odd even 
    for i in 0..=10 {
        if i % 2 == 0 {
            println!("Even number: {}", i);
        } else {
            println!("Odd number: {}", i);
        }
    }



    // for and iterator
    // iter: immutable reference, does not take ownership
    // into_iter: takes ownership and moves the value out of the collection
    // iter_mut: mutable reference to the value in the collection
    
    let v = vec![1, 2, 3, 4, 5];
    // immutable reference
    for i in v.iter() {
        println!("Reference: {}", i);
    }
    // v is still available
    println!("Vector: {:?}", v);

    let v = vec![1, 2, 3, 4, 5];
    for i in v.into_iter() {
        println!("Ownership: {}", i);
    }
    // v is not available
    // println!("Vector: {:?}", v);


    // mutable reference
    let mut v = vec![1, 2, 3, 4, 5];
    for i in v.iter_mut() {
        *i += 1;
        println!("Mutable reference: {}", i);
    }
    // v is still available
    println!("Vector: {:?}", v);

    ///////////////////////////////// match //////////////////////////////////
    // match is used to compare a value against a series of patterns
    let number = 5;
    match number {
        // single value
        1 => println!("One"),
        // multiple values
        2 | 3 | 5 | 7 => println!("Prime"),
        // range
        10..=20 => println!("Between 10 and 20"),
        // default
        _ => println!("Default"),
    }

}
