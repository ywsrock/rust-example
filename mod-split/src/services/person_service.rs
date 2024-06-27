 use crate::models::person::Person;

 pub fn get_person(name: &str, age: i32) -> Person {
   let p = Person::new(name, age);
    p
 }
