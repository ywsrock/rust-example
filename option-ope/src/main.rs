fn adult(person: Option<&str>) -> Option<&str> {
    let s = person.unwrap();
    println!("Person is: {}", s);

    match person {
        Some("child") => None,
        Some("adult") => Some("adult"),
        _ => None,
    }
}


#[derive(Debug, Clone, Copy)]
struct Person {
    age: Option<u8>
}

#[derive(Debug, Clone, Copy)]
struct Class {
    students: Option<Person>
}

#[derive(Debug, Clone, Copy)]
struct School {
    classes: Option<Class>
}


impl School {
    fn get_person_age(&self) -> Option<u8> {
        self.classes?.students?.age
    }
}

// map
fn option_map() {
    let x = Some(10);
    let y = x.map(|v| v * 2);
    println!("{:?}", y);
}
// and_then
fn option_and_then() {
    let x = Some(Some(Some(10)));
    let y = x.and_then(|v| v.and_then(|v| v.map(|v| v * 2)));
    println!("{:?}", y);
}

// or
fn option_or() {
    let x = Some(10);
    let y = x.or(Some(20));
    println!("{:?}", y);
}

// or_else
fn option_or_else() {
    let x = None;
    let y = x.or_else(|| Some(20));
    println!("{:?}", y);
}


fn main() {
    let person = Some("child");
    match adult(person) {
        Some("adult") => println!("Is an adult"),
        None => println!("Is not an adult"),
        _ => println!("Is not a person"),
    };

    let school = School {
        classes: Some(Class {
            students: Some(Person {
                age: Some(10)
            })
        })
    };

    if let Some(age) = school.get_person_age() {
        println!("Age is: {}", age);
    } else {
        println!("Age is not available");
    }

    option_map();
    option_and_then();
    option_or();    
    option_or_else();
}   

