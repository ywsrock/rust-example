fn main() {
    
    // Declaring a variable
   let a : i32 = 10;
   print ! ("Value of a is : {} \n", a);

   // Declaring a variable with a reference
   let b : &str = "Hello, World!";
   println ! ("Value of b is : {}", b);

   // Declaring a variable with a mutable reference
   let tuple = (1, 2, 3, 4, 5);
   println ! ("Value of tuple is : {:?}", tuple);

   // Destructuring a tuple
   #[allow(unused_variables)]
   let (a, b, c, d, e) = tuple;
   println ! ("Value of a is : {}", a);

   // Declaring a variable with a mutable reference
   let hello : String = String::from("Hello, World!");
   println ! ("Value of hello is : {}", hello);

    
   // Declaring a variable with a mutable reference
   let array : [i32; 5] = [1; 5];
    println ! ("Value of array is : {:?}", array);

    // Declaring a variable with a mutable reference
    let array : [i32; 5] = [1, 2, 3, 4, 5];
    println ! ("Value of array is : {:?}", array);

    
    // Declaring a variable with a mutable reference
    let slice = &array[1..4];
    println ! ("Value of slice is : {:?}", slice);

    // Declaring a variable with a mutable reference
    for i in 0..array.len() + 1 {
        match array.get(i) {
            Some(value) => println ! ("Value of array at index {} is : {}", i, value),
            None => println ! ("Value of array at index {} is : None", i),
        }
    }

    // .expect() is used to handle the error
    for i in 0..array.len() + 1 {
        let value = array.get(i).expect("Index out of bounds");
        println ! ("Value of array at index {} is : {}", i, value);
    }
}
