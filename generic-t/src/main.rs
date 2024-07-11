/// Generics are a way to make code more flexible and reusable.
/// <T> is a generic type parameter. It is a placeholder for the actual type that will be used when the function is called.

// generic function
fn generic<T>(x: T) -> T {
    x
} 

// generic struct
#[derive(Debug)]
struct P<T>(T);

// generic method
impl<T> P<T> {
    fn get(&self) -> &T {
        &self.0
    }
}

impl P<i32> {
    fn add(&self, x: i32) -> i32 {
        self.0 + x
    }
}

// generic trait
trait G<T> {
    fn get(&self,t:T) -> T;
}


// generic trait implementation
// T: type parameter
// U: type parameter .U is self
// impl<T,U> G<T> for U
impl<T,U> G<T> for U {
    fn get(&self, t:T) -> T {
        t
    }
}


/////////////////////////// GENERIC TRAIT BOUNDARY ///////////////////////////
trait A {};
trait B {};
trait C<T> {
    fn get(&self, t:T) -> T; 
};

struct S;

impl<T:A +B> C<T> for S {
    fn get(&self, t:T) -> T {
        t
    }
}




// generic trait boundary
fn generic_trait_bound<T: G<i32>>(x: T) -> i32 {
    x.get(5)
}

fn main() {
    /////////////////////////// GENERIC FUNCTION ///////////////////////////
    let x = 5;
    let result = generic(x);
    println!("Result: {}", result);


    let y = "Hello";
    let result = generic(y);
    println!("Result: {}", result);


    let z = P(5);
    let result = generic(z);
    println!("Result: {:?}", result);

    let k = generic::<i32>(66);
    println!("Result: {}", k);


    /////////////////////////// GENERIC METHOD ///////////////////////////
    let p = P(5);
    println!("Result: {:?}", p.get());

    let p = P(5);
    println!("Result: {:?}", p.add(5));

    /////////////////////////// GENERIC TRAIT ///////////////////////////
    struct S;
    let a = 5;
   let y =  S.get(a);
   println!("Trait Result: {}", y);

   /////////////////////////// GENERIC TRAIT BOUNDARY ///////////////////////////
    let ff = org_x.get(5);
    println!("Trait Result: {}", ff);
}
