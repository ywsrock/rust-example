pub struct Person {
    name: String,
    age: i32,
}

impl Person {
   pub fn new(name: &str, age: i32) -> Person {
        Person {
            name: name.to_string(),
            age,
        }
    }

    pub fn get_name(&self) -> &str {
        &self.name
    }

    pub fn get_age(&self) -> i32 {
        self.age
    }
}

