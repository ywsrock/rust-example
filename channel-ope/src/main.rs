use std::{sync::mpsc, thread};

static TOTALNUM: i32 = 10;

fn main() {
    let (tx, rx) = mpsc::channel();
    let mut handles = vec![];

    for i in 0..TOTALNUM {
        let sender = tx.clone();
        let h = thread::spawn(move || {
            sender.send(i).unwrap();
        });

        handles.push(h);
    }

    drop(tx);

    for received in rx {
        println!("Got: {}", received);
    }

    for h in handles {
        h.join().expect("thread-error");
    }
}
