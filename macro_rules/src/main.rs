/// rust macro
/// rust macro disanator:
/// 1. item: match item declartion
/// item アイテム（関数、構造体など）: モジュール内におけるものは全部itemとして扱われる
///     - crate,fn,struct,enum,trait,type,mod,static,impl,extern,macro_rules,macro
/// block    ブロック: {} で囲まれたもの
/// stmt ステートメント（文）: 1行のコード, 末尾のセミコロンを含む
///     - stmtマッチするものは、式文、宣言文、マクロ呼び出し文:例：let x = 1;、println!("Hello, world!");
/// pat  パターン: match文の中で使われるパターン
/// expr 式: 1つの値を返すもの, 末尾のセミコロンを含まない, 例：1 + 2
/// ty   型: i32, f64, Stringなど 予約語はマッチしない
/// ident    識別子; 例: x, foo, bar 予約語はマッチします。
///
/// path 修飾された名前。例: T::SpecialA ::std::mem::size_of
/// tt   単一のトークン木 : 1つのトークンを表す
/// meta アトリビュートの中身。例: cfg(target_os = "windows" : "foo")
///
/// loop: ループ: +や*を使って繰り返しを表現する $(),* など


// start with macro_rules! keyword
macro_rules! say_hello {
    () => {
        println!("Hello, world!");
    };
}


// Example : item
macro_rules! create_Item {
    ($it:item) => {
        println!("item: {:?}", stringify!($it));
    };
}

// Example : block
macro_rules! create_Block {
    ($it:block) => {
        println!("block: {:?}", stringify!($it));
    };
}

// Example : stmt
macro_rules! create_Stmt {
    ($it:stmt) => {
        println!("stmt: {:?}", stringify!($it));
    };
}

// Example : pat
macro_rules! create_Pat {
    ($it:pat) => {
        println!("pat: {:?}", stringify!($it));
    };
}

// Example : expr
macro_rules! create_Expr {
    ($it:expr) => {
        println!("expr: {:?}", stringify!($it));
    };
}

// Example : ty
macro_rules! create_Ty {
    ($it:ty) => {
        println!("ty: {:?}", stringify!($it));
    };
}

// Example : ident
macro_rules! create_Ident {
    ($it:ident) => {
        println!("ident: {:?}", stringify!($it));
    };
}


// Example : loop
macro_rules! create_Loop {
    ($($x:expr),+) => {
        println!("loop: {:?}", stringify!(($($x),+)));
    };
}

macro_rules! find_min {
    // Base case:
    // 基本となるケース
    ($x:expr) => ($x);
    // `$x` followed by at least one `$y,`
    // `$x`に少なくとも1つの`$y`が続く場合
    ($x:expr, $($y:expr),+) => (
        // Call `find_min!` on the tail `$y`
        // `find_min!`を残りの`$y`に対して再帰的に適用
        std::cmp::min($x, find_min!($($y),+))
    )
}


// Example : 再帰マクロ
macro_rules! create_Foo {
    ($x:expr) => {
        let val:usize = $x;
        println!("expr: {:?}", val);
    };

    ($x:expr, $($y:expr),+) => {
        println!("expr: {:?}={}", stringify!($x), $x);
        create_Foo!($($y),+);
    };
}


fn main() {
    say_hello!();
    ////////////////////////////// item //////////////////////////////
    // macro_rules! say_hello {
    create_Item!(say_hello!(););
    // fn
    create_Item!(fn foo() {});
    // struct
    create_Item!(struct Bar;);
    // enum
    create_Item!(enum Baz {});

    ////////////////////////////// block //////////////////////////////
    create_Block!({println!("Hello, world!");});

    ////////////////////////////// stmt //////////////////////////////
    // param no semicolon
    create_Stmt!(let x = 1);
    create_Stmt!(println!("Hello, world!"));

    ////////////////////////////// pat //////////////////////////////
    create_Pat!(Some(x));
    create_Pat!(1);

    ////////////////////////////// expr //////////////////////////////
    create_Expr!(1 + 2);
    create_Expr!(return 1 + 2);

    ////////////////////////////// ty //////////////////////////////
    create_Ty!(i32);
    create_Ty!(f64);
    create_Ty!(String);

    ////////////////////////////// ident //////////////////////////////
    create_Ident!(x);
    create_Ident!(i32);
    create_Ident!(let);

    ////////////////////////////// loop //////////////////////////////
    create_Loop!(1, 2, 3);

     let x = find_min!(9, 2 * 4);
     println!("x: {:?}", x);

    ////////////////////////////// 再帰マクロ //////////////////////////////
    create_Foo!(1 + 1, 2 + 2, 3 + 3, 4 + 4, 5 + 5);

}
