/// rust destructuring
/// tuple destructuring
/// array destructuring
/// struct destructuring
/// enum destructuring
/// reference destructuring
/// slice destructuring
/// pattern destructuring

fn main() {
    // tuple destructuring
    // let tuple = (1, 2, 3);
    let tuple = (4, 2, 5);
    // let (a, b, c) = tuple;
    // println!("tuple destructuring: a = {}, b = {}, c = {}", a, b, c);
    // .. can be used to ignore some values
    // let (a, .., c) = tuple;
    // can be used onece only
    #[allow(unused_variables)]
    match tuple {
        // single variable
        (1,..) => println!("tuple destructuring: a = {}", 1),
        (..,3) => println!("tuple destructuring: c = {}", 3),
        (1,..,3) => println!("tuple destructuring: a = {}, c = {}", 1, 3),
        (..,2,_) => println!("tuple destructuring: b = {}", 2),
        _ => println!("tuple destructuring: a = {}, b = {}, c = {}", 1, 2, 3),
    }

    // array and slice destructuring
    let array = [1, 2, 3];
        #[allow(unused_variables)]
    match array {
        [a, b, c] => println!("array destructuring: a = {}, b = {}, c = {}", a, b, c),
        [a, ..] => println!("array destructuring: a = {}", a),
        [a, b, ..] => println!("array destructuring: a = {}, b = {}", a, b),
        [a, b, c, ..] => println!("array destructuring: a = {}, b = {}, c = {}", a, b, c),
        [1,_,3] => println!("array destructuring: a = {}, c = {}", 1, 3),
        [3,b,tail @ ..] => println!("array destructuring: a = {}, b = {}, c = {:?}", 1, b, tail),
        _ => println!("array destructuring: a = {}, b = {}, c = {}", 1, 2, 3),
    }

    // enum destructuring
    #[derive(Debug)]
    enum Enum {
        A,
        B(i32),
        C { x: i32, y: i32 },
    }
    match Enum::B(1) {
        Enum::A => println!("enum destructuring: A"),
        Enum::B(x) => println!("enum destructuring: B({})", x),
        Enum::C { x, y } => println!("enum destructuring: C {{ x: {}, y: {} }}", x, y),
    }

    // pointer and reference destructuring
    // dereference operator *
    // destructuring operator ref, ref mut,&, &mut

    let reference = &4;
    match reference {
        // reference destructuring
        &val => println!("reference destructuring: val = {}", val),
    }

    // to avoid reference destructuring before match
    match *reference {
        // reference destructuring before match
        val => println!("reference destructuring: val = {}", val),
    }

    // use ref to create a reference to the value
    let ref reference = 5;
    match reference {
        // reference destructuring
        &val => println!("reference destructuring: val = {}", val),
    }

    // avoid reference destructuring before match
    match *reference {
        // reference destructuring before match
        val => println!("reference destructuring: val = {}", val),
    }

    // struct destructuring
    struct Struct {
        x: (i32, i32),
        y: i32,
    }
    let struct1 = Struct { x: (3, 2), y: 3 };
    match struct1 {
        Struct { x: (1, b), y } => println!("struct destructuring: a = {}, b = {}, y = {}", 1, b, y),
        Struct { y,.. } => println!("struct destructuring: y = {}", y),
        Struct { y,x:i } => println!("struct destructuring: x = {:?}, y = {}", i, y),
        _ => println!("struct destructuring: x = {:?}, y = {}", (1, 2), 3),
    }


}
