/// rustc --crate-type=lib libyws.rs : to compile the library
///
/// rustc main.rs --extern yws=libyws.rlib && ./main  : to use the library
/// cargo.tom:[lib] section can be used to specify the library
/// cargo build --lib : to build the library


fn main() {
    // when rustc main.rs --extern yws=libyws.rlib && ./main is used
    yws::say_hello();
    yws::indirect_say_age();
   

}
