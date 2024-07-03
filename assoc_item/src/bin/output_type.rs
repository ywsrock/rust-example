/// associated type
/// type A and type B are associated types

trait OutputType {
    type A;
    type B;

    fn constains(&self, _: &Self::A, _: &Self::B) -> bool;
    fn first(&self) -> i32;
    fn second(&self) -> i32;
}

struct Pair {
    first: i32,
    second: i32,
}

impl OutputType for Pair {
    type A = i32;
    type B = i32;

    fn constains(&self, a: &i32, b: &i32) -> bool {
        (&self.first == a) && (&self.second == b)
    }

    fn first(&self) -> i32 {
        self.first
    }

    fn second(&self) -> i32 {
        self.second
    }
}

fn diffence<C: OutputType>(container: &C) -> i32 {
        container.second() - container.first()
}


fn main() {
    let x = 4;
    let y = 5;

    let pair = Pair{
        first: x,
        second: y,
    };

    let r = diffence(&pair);
    println!("{}",r);



}
