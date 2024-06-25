///  struct: 構造体を定義する
///    - ダブルクォートで囲まれた文字列を持つ
///    - フィールドを持つ
///    - ユニット構造体

///  enum: 列挙型を定義する
///     - ユニット型
///     - タプル型
///     - 構造体型

#[allow(dead_code)]


//////////////////////////////////////////////////////////////////// Struct ////////////////////////////////////////////////////////////////////
// ユニット構造体
#[derive(Debug)]
struct UnitStruct;


// フィールドを持つ構造体
#[derive(Debug)]
struct Point {
    x: i32,
    y: i32,
}


// ダブルクォートで囲まれた文字列を持つ構造体
#[derive(Debug)]
struct StringStruct(String, String);


// 他の構造体をフィールドに持つ構造体
#[derive(Debug)]
struct Rectangle {
    top_left: Point,
    bottom_right: Point,
}


//////////////////////////////////////////////////////////////////// enum ////////////////////////////////////////////////////////////////////

// ユニット型
#[derive(Debug)]
enum UnitEnum {
    A,
    B,
    C,
}

// タプル型
#[derive(Debug)]
enum TupleEnum {
    A(i32),
    B(i32, i32),
    C(i32, i32, i32),
}

// 構造体型
#[derive(Debug)]
enum StructEnum {
    A { x: i32 },
    B { x: i32, y: i32 },
    C { x: i32, y: i32, z: i32 },
}

// 全部まとめてEnum
#[derive(Debug)]
enum WebEvent {
    PageLoad,
    PageUnload,
    KeyPress(char),
    Paste(String),
    Click { x: i64, y: i64 },
}


fn Inspenct(event: WebEvent) {
    match event {
        WebEvent::PageLoad => println!("page loaded"),
        WebEvent::PageUnload => println!("page unloaded"),
        WebEvent::KeyPress(c) => println!("pressed '{}'", c),
        WebEvent::Paste(s) => println!("pasted \"{}\"", s),
        WebEvent::Click { x, y } => {
            println!("clicked at x={}, y={}", x, y);
        }
    }
}

// C言語のような書き方
// 値を明示しない場合、0から整数が順に入る。
enum Work {
    Civilian,
    Soldier,
}

// 値を設定
enum Status {
    Rich = 1,
    Poor = 0,
}



fn main() {

    ////////////////////////////////////////////////////////////////////// Struct ////////////////////////////////////////////////////////////////////
   
    // ユニット構造体のインスタンスを作成
    let _unit = UnitStruct;
    println!("{:?}", _unit);

    // フィールドを持つ構造体のインスタンスを作成
    let point = Point { x: 10, y: 20 };
    println!("{:?}", point);

    // ダブルクォートで囲まれた文字列を持つ構造体のインスタンスを作成
    let string_struct = StringStruct("Hello".to_string(), "World".to_string());
    println!("{:?}", string_struct);


    // 他の構造体をフィールドに持つ構造体のインスタンスを作成
    let top_left = Point { x: 10, y: 20 };
    let bottom_right = Point { x: 30, y: 40 };
    let rectangle = Rectangle { top_left, bottom_right };
    println!("{:?}", rectangle);

    // フィールドの値を取得
    println!("top_left.x: {}", rectangle.top_left.x);
    println!("top_left.y: {}", rectangle.top_left.y);

    // 構造体のデストラクト
    let Rectangle { top_left, bottom_right } = rectangle;
    println!("top_left.x: {}", top_left.x);

    // フィールドの値を変更
    let point = Point { x: 20, ..point };
    println!("{:?}", point);

    ////////////////////////////////////////////////////////////////////// enum ////////////////////////////////////////////////////////////////////
   
    println!("------------------- enum -------------------");

    // ユニット型の列挙型のインスタンスを作成
    let _unit_enum = UnitEnum::A;
    println!("{:?}", _unit_enum);

    // タプル型の列挙型のインスタンスを作成
    let tuple_enum = TupleEnum::B(10, 20);
    println!("{:?}", tuple_enum);

    // 構造体型の列挙型のインスタンスを作成
    let struct_enum = StructEnum::C { x: 10, y: 20, z: 30 };
    println!("{:?}", struct_enum);

    // 全部まとめてEnum
    let pressed = WebEvent::KeyPress('x');
    let pasted = WebEvent::Paste("my text".to_owned());
    let click = WebEvent::Click { x: 20, y: 80 };
    let load = WebEvent::PageLoad;
    let unload = WebEvent::PageUnload;

    let events = vec![pressed, pasted, click, load, unload];
    for event in events {
        Inspenct(event);
    }

    // use を利用することで、Enumの値を簡単に使える(名前空間を省略できる)
    use WebEvent::*;
    let pressed = KeyPress('x');
    let pasted = Paste("my text".to_owned());
    let click = Click { x: 20, y: 80 };
    let load = PageLoad;
    let unload = PageUnload;

    let events = vec![pressed, pasted, click, load, unload];
    for event in events {
        Inspenct(event);
    }

    // C言語のような書き方
    let _civillian = Work::Civilian;
    println!("Civilian as u32: {}", Work::Civilian as u32);

    // 値を設定
    println!("Rich as u32: {}", Status::Rich as u32);

}
