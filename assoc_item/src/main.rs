/// コンテナ型に、その要素に対してジェネリックなトレイトを実装した場合、そのトレイトを使用する者は全てのジェネリック型を明記 しなくてはなりません 。

// トレイトの定義
trait Foo<A, B> {
    fn constains(&self, _: A, _: B) -> bool; // Explicitly requires `A` and `B`.
    fn first(&self) -> i32;
    fn second(&self) -> i32;
}

// トレイトの実装の場合、ジェネリック型を明記しないとエラーになる
struct Bar(i32, i32);

impl Foo<i32, i32> for Bar {
    fn constains(&self, x: i32, y: i32) -> bool {
        (self.0 == x) && (self.1 == y)
    }

    fn first(&self) -> i32 {
        self.0
    }

    fn second(&self) -> i32 {
        self.1
    }
}

fn difference<A,B,C>(container: &C) -> i32 where
C: Foo<A, B> {
    container.first() - container.second()
}


fn main() {
    let x = 1;
    let y = 2;
    let bar = Bar(x, y);
    println!("{}", difference(&bar));

    let x = 3;
    let y = 4;
    let bar = Bar(x, y);
    let result = bar.constains(x,y);
    println!("{}", result);

}
