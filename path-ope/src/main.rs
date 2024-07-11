use std::path::Path;

fn main() {
    let path = Path::new(".");
    println!("The path is {}", path.display());

    let new_path = path.join("a").join("b");
    println!("The new path is {}", new_path.display());

    match new_path.to_str() {
        Some(s) => println!("The new path is {}", s),
        None => panic!("The new path is not a valid UTF-8 sequence"),
    }
}
