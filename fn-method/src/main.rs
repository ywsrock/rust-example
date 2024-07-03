/// function and method sample
/// associated function: function that is called on the type itself
/// method: function that is called on an instance of a type

// Person struct
#[derive(Debug)]
#[warn(dead_code)]
struct Person {
    name: String,
    age: u8,
}

impl Person {
    // associated function
    fn new(name: &str, age: u8) -> Person {
        Person {
            name: name.to_string(),
            age,
        }
    }

    // method
    // &self: immutable reference to the instance of the type
    fn say_hello(&self) {
        println!("Hello, my name is {}", self.name);
    }

    // &mut self: mutable reference to the instance of the type
    fn have_birthday(&mut self) {
        self.age += 1;
        println!("Happy birthday! You are now {} years old", self.age);
    }
}

fn main() {
    let mut person = Person::new("ywsrock", 20);
    println!("{:?}", person);
    person.say_hello();
    person.have_birthday();
}
