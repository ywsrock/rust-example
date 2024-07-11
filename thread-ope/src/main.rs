use std::thread;

fn main() {
    basic_thread();
    
    let mut sub_threads =vec![];
    map_reduce(&mut sub_threads);
    let sum = sub_threads.into_iter().map(|t| t.join().unwrap()).sum::<u32>();
    println!("Total sum: {}", sum);
}

fn basic_thread() {
    let num = 10;
    let mut threads = vec![];

    for i in 0..num {
       let th = thread::spawn(move || {
            println!("Thread number: {}", i);
        });
       threads.push(th);
    }

    for th in threads {
        th.join().unwrap();
    }
}

fn map_reduce(sts: &mut Vec<thread::JoinHandle<u32>>) {
    let str = "123
    456
    789
    101112
    ";  

    // split by withespace
    let chunk_data = str.split_whitespace();
    for (i, chunk) in chunk_data.enumerate() {
        let th = thread::spawn(move || {
            let sum = chunk.chars().map(|c| c.to_digit(10).unwrap()).sum::<u32>();
            println!("Chunk {} sum: {}", i, sum);
            sum
        });
        sts.push(th);
    }
}
