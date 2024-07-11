// Traits are used to define the functionality of a type. Traits are similar to interfaces in other languages.
trait Animal {
    fn sing(&self) -> String;
}

// Define a trait named Action, which has a method named fly, which returns a string. Super trait Action: Animal
trait Action: Animal {
    fn fly(&self) -> String;
}

struct Bird {
    name: String,
}

// trait implementation for Bird
impl Animal for Bird {
    fn sing(&self) -> String {
        format!("{} is singing", self.name)
    }
}

// trait implementiation for Bird
impl Action for Bird {
    fn fly(&self) -> String {
        format!("{} is flying", self.name)
    }
}

// Disambiguation between the two traits
trait Person {
    fn get_name(&self) -> String;
}

trait Employee {
    fn get_name(&self) -> String;
}

struct EmployeePerson {
    name: String,
}

impl Person for EmployeePerson {
    fn get_name(&self) -> String {
        format!("Person name: {}", self.name)
    }
}

impl Employee for EmployeePerson {
    fn get_name(&self) -> String {
        format!("Employee name: {}", self.name)
    }
}

fn dny_bird(bird: &impl Action) {
//fn dnyBird(bird: &dyn Action) {
    println!("{}", bird.fly());
    println!("{}", bird.sing());
}

fn main() {
    let bird = Bird {
        name: String::from("Sparrow"),
    };

    dny_bird(&bird);
    println!("{}", bird.fly());
    println!("{}", bird.sing());


    // Disambiguation between the two traits
    let employee_person = EmployeePerson {
        name: String::from("John"),
    };

    println!("{}", <EmployeePerson as Person>::get_name(&employee_person));
    println!("{}", <EmployeePerson as Employee>::get_name(&employee_person));
}
