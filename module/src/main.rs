/// Module is a way to organize the code in a logical way. It is a collection of items such as functions, structs, traits, impl blocks, and even other modules.
/// sttruct fields can be public or private. By default, struct fields are private. To make a field public, use the pub keyword before the field.


mod  my_mod {
    // nested module
    mod my_sub_mod {
            pub fn my_sub_function() {
                println!("This is my sub function");
            }

            pub (in crate::my_mod) fn my_function() {
                println!("in create: This is my function");
            }
        }

    // public function
    pub fn my_function() {
        println!("This is my function");
    }

    pub fn call_my_sub_function() {
        // calling sub module function
        my_sub_mod::my_sub_function();
    }


    // calling sub module function in path
    pub fn call_my_sub_my_function() {
        // calling sub module function
        my_sub_mod::my_function();
    }
}


// module for struct
mod st {
    #[allow(non_snake_case)]
    pub struct OpenStudent {
        // public field
        pub name: String,
    }


    #[derive(Debug)]
    #[allow(non_snake_case)]
    pub struct CloseStudent {
        // private field
        name: String,
    }

    // constructor function for CloseStudent
    impl CloseStudent {
        pub fn new(name: String) -> CloseStudent {
            CloseStudent {
                name
            }
        }
    }
}


fn main() {

    ////////////////////////////// Module //////////////////////////////
    // parent module
    my_mod::my_function();

    // sub module is private , so it can't be accessed
    //my_mod::my_sub_mod::my_sub_function();
    my_mod::call_my_sub_function();
    my_mod::call_my_sub_my_function();

    ////////////////////////////// Struct //////////////////////////////
    let OpenStudent = st::OpenStudent {
        name: String::from("Open Student")
    };
    println!("Open Student Name: {}", OpenStudent.name);

    let CloseStudent = st::CloseStudent::new(String::from("Close Student"));
    println!("Close Student Name: {:?}", CloseStudent);
}
