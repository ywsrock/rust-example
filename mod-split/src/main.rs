mod models;
mod services;

use services::person_service::get_person;

fn main() {
   let name = "John";
   let age = 25;

   let p = get_person(name, age);
   println!("Person: {:?}", p.get_name());
   println!("Person: {:?}", p.get_age());
}
