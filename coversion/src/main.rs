use std::convert::TryFrom;
use std::convert::TryInto;
use std::fmt::{self, Display};
use std::str::FromStr;


/// rust primitive type casting use `as`
/// custom type casting use `From` and `Into` trait
/// generic type casting use `From` and `Into` trait
/// TryFrom and TryInto trait for fallible conversions
/// To String type useing fmt::Display trait
/// Parsing string to type using `FromStr` trait

// From and Into
// if we implement `From` trait, we get `Into` for free
// if we implement `Into` trait, we get `From` for free
// custom type Person
#[derive(Debug)]
struct Person {
    name: String,
}

// implement From trait for Person
impl From<&str> for Person {
    fn from(name: &str) -> Self {
        Person {
            name: name.to_string(),
        }
    }
}

// TryFrom and TryInto
// fallible custom type Number
#[derive(Debug)]
struct Number (i32);

// implement TryFrom trait for Number
impl TryFrom<i32> for Number {
    type Error = ();
    fn try_from(value: i32) -> Result<Self, Self::Error> {
        if value < 0 {
            Err(())
        } else {
            Ok(Number(value))
        }
    }
}

// To String type using fmt::Display trait
#[derive(Debug)]
struct Circle {
    radius: i32,
}

// implement fmt::Display trait for Circle
// toString method is implemented for Display trait and it is called by println! macro
impl Display for Circle {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Circle of radius {}", self.radius)
    }
}

// implement FromStr trait for Circle
// parsing string to Circle type
impl FromStr for Circle {
    type Err = std::num::ParseIntError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let radius = s.parse()?;
        Ok(Circle { radius })
    }
}

fn main() {
    // str to String
    let s: &str = "hello";
    let my_string = String::from(s);
    println!("my_string: {}", my_string);

    // str to Person
    let p: Person = Person::from(s);
    println!("p: {:?}", p);

    // into is implemented for Person
    let p: Person = s.into();
    println!("p: {:?}", p);

    
    // i32 to Number
    match Number::try_from(10) {
        Ok(n) => println!("n: {:?}", n),
        Err(()) => println!("Error"),
    }

    // i32 to Number fallible
    if let Ok(n) = Number::try_from(-10) {
        println!("n: {:?}", n);
    } else {
        println!("Error");
    }

    // Tryinto is implemented for Number
    let n: Result<Number, ()> = 10.try_into();
    if let Ok(n) = n {
        println!("n: {:?}", n);
    } else {
        println!("Error");
    }


    // To String type using fmt::Display trait
    let c = Circle { radius: 10 };
    println!("{}", c.to_string());

    let c: Circle = Circle::from_str("10").unwrap();
    println!("{:?}", c);

}
