/// This is a rust closure example
/// Closure is a function that captures the environment : &T, &mut T, T
/// Closure type is Fn, FnMut, FnOnce
/// Fn: The closure captures the environment by reference
/// FnMut: The closure captures the environment by mutable reference
/// FnOnce: The closure captures the environment by move
/// scope of the closure: Fn < FnMut < FnOnce
/// return closure type: FnOnce < FnMut < Fn
/// implement Fn, FnMut, FnOnce trait for closure type


fn main() {

    ////////////////////////////////////////// enviroment capture //////////////////////////////////////////
    // Closure is a function that captures the environment
    // Closure can be stored in a variable
    let b = 10;
    let add =|a| a+b;
    let result= add(20);
    println!("The result is: {}", result);

    // Closure can capture the environment by blowe :
    // 1. &T is a reference to the environment
    // 2. &mut T is a mutable reference to the environment
    // 3. T is a move of the environment

    // Example of closure that captures the environment by reference
    let reference = "ywsrock".to_string();
    // The closure is a reference to the environment
    let print = || println!("The reference is: {}", reference);
    // reference is borrowed by the closure
    print();
    print();

    // The closure is a reference to the environment, so the reference is borrowed by the closure
    let _re_reference = &reference;

    // Example of closure that captures the environment by mutable reference
    let mut mutable_reference = "ywsrock".to_string();
    // The closure is a mutable reference to the environment
    let mut print = || {
        mutable_reference.push_str(" is a rustacean");
        println!("The mutable reference is: {}", mutable_reference);
    };

    // call the closure per, the mutable reference will be borrowed by the closure,and change the value
    print();
    // can't borrow `mutable_reference` as mutable more than once at a time
    // let _re_mutable_reference = &mut mutable_reference;
    print();

    // Example of closure that captures the environment by move
    // move keyword is used to move the environment into the closure
    let mv_value = "ywsrock".to_string();
    let print = move || println!("The move value is: {}", mv_value);
    print();
    // can't borrow `mv_value` after move
    // println!("The move value is: {}", mv_value);


    ////////////////////////////////////////// closure type //////////////////////////////////////////
    // Closure type is Fn, FnMut, FnOnce
    //
    // Fn: The closure captures the environment by reference
    // Example of closure type Fn
    let b = 10;
    let add =|a| a+b;
    let result= apply_fn(add);
    println!("The result is: {}", result);

    // FnMut: The closure captures the environment by mutable reference
    // Example of closure type FnMut
    let mut b = 10;
    let add =|a| {
        b += 1;
        a+b
    };
    let result= apply_fn_mut(add);
    println!("The result is: {}", result);

    // FnOnce: The closure captures the environment by move
    // Example of closure type FnOnce
    let mut mv_value = "ywsrock".to_string();
    let print = move || {
        mv_value.push_str(" is a rustacean");
        mv_value
    };
    let result = apply_fn_once(print);
    println!("The result is: {}", result);

    // Function that takes a closure as an argument
    call(closure_example);


    ////////////////////////////////////////// implement Fn, FnMut, FnOnce trait for closure type //////////////////////////////////////////
    // Example of closure type Fn
    return_fn_closure()();
    
}


// Fn: The closure captures the environment by reference
fn apply_fn<F>(f: F) -> i32 
    where F: Fn(i32) -> i32 {
    f(10)
}

// FnMut: The closure captures the environment by mutable reference
fn apply_fn_mut<F>(mut f: F) -> i32 
    where F: FnMut(i32) -> i32 {
    f(10)
}

// FnOnce: The closure captures the environment by move
fn apply_fn_once<F>(f: F) -> String
    where F: FnOnce() -> String  {
    f()
}


// Function that takes a closure as an argument
fn call<F>(f:F) where F: Fn() {
    f();
}

// Closure example as a function
fn closure_example() {
   println!("This is a closure example as a function"); 
}


// return Fn type closure
// move keyword is used to move the environment into the closure
fn return_fn_closure() -> impl Fn() {
    let yws = "ywsrock".to_string();
    let say_hello = move || {
        println!("Hello, {}", yws);
    };
    say_hello
}
