/// rust error handling
/// 1. panic! macro: for unrecoverable errors, it will print the error message and exit the program
/// 2. abort ,unwind, or custom panic handler: rustc main.rs -C panic=abort  #[cfg(panic = "unwind")]
/// 3. Option<T> and unwrap: for recoverable errors, it will return the value if it is Some, otherwise it will panic
/// 4. ? operator: return the value if it is Some, otherwise it will return None
/// 5. add_then:  return the wrap value if it is Some, otherwise it will return None: ex: some(5).and_then(|x| Some(x+1)) => Some(6); x is 5
/// 6. map: return the wrap value if it is Some, otherwise it will return None: ex: some(5).map(|x| x+1) => Some(6); x is 5 
/// 7. or: if it is None, it will return the other value: ex: None.or(Some(5)) => Some(5)
/// 8. or_else: if it is None, it will return the other value: ex: None.or_else(|| Some(5)) => Some(5)
///     map: Option<T>の値に対して操作を行い、Option<U>を返す。
///     and_then: Option<T>の値に対して操作を行い、新しいOption<U>を返す。
///     or: OptionがNoneの場合に代替のOptionを返す。(orは、代替のOptionが既に決まっている場合に使います。）
///     or_else: OptionがNoneの場合に代替のOptionを返すが、そのOptionは関数を呼び出して生成する。(or_elseは、代替のOptionを動的に生成する必要がある場合に使います。）


// Example 1: panic! macro
#[allow(dead_code)]

fn panic_example() {
    panic!("crash and burn");
}


// Example 2: abort,unwind
#[cfg(panic = "unwind")]
fn error_handler(s: &str) {
    if s == "hello" {
        panic!("crash and burn [unwind]  hello]");
    } else {
        println!("Hello, {}", s);
    }
}

#[cfg(panic = "abort")]
fn error_handler(s: &str) {
    // when not hello, it will panic and abort the program
    if s != "hello" {
        panic!("crash and burn [abort] not hello");
    } else {
        println!("Hello, {}", s);
    }
}

// Example 3: Option<T> and unwrap
// some(T): value is present
// None: value is absent
fn option_example() {
    let x: Option<i32> = Some(5);
    let y: Option<i32> = None;

    // unwrap() will return the value if it is Some, otherwise it will panic
    println!("{}", x.unwrap());
    // None will panic
    // println!("{}", y.unwrap());
}

// Example 4: Expect
fn expect_example() {
    let x: Option<i32> = Some(5);
    let y: Option<i32> = None;

    // expect() will return the value if it is Some, otherwise it will panic with the message
    println!("{}", x.expect("Failed to get value"));
    // None will panic with the message
    // println!("{}", y.expect("Failed to get value"));
}

////////////////////////// ? operator //////////////////////////
#[derive(Debug, Clone)]
struct Class {
    name: Option<Student>,
}

#[derive(Debug, Clone)]
struct Student {
    name: Option<String>,
}

impl Class {
    fn get_student_name(&self) -> Option<String> {
        // self.name.as_ref().and_then(|student| student.name.as_ref()).map(|name| name.to_string())
        //Some(self.name.as_ref()?.name.as_ref()?.to_string())
        self.name.clone()?.name.clone()
    }
}



fn main() {
    // Example 1: panic! macro
    // panic_example();
    //println!("This will not be printed");

    // Example 2: abort,unwind
    error_handler("hello");
    option_example();
    expect_example();

    ////////////////////////// ? operator //////////////////////////
    let student = Student {
        name: Some("John".to_string()),
    };

    let class = Class {
        name: Some(student),
    };
    println!("{:?}", class.get_student_name());
}
