use std::fs::{read, read_to_string, File};
use std::io::{self, prelude::*};
use std::path::Path;

fn main() {
    match read_file() {
        Ok(s) => println!("{}", s),
        Err(e) => println!("Error: {}", e),
    }

    match read_lines() {
        Ok(v) => {
            for line in v {
                println!("{}", line);
            }
        }
        Err(e) => println!("Error: {}", e),
    }

    let lines = read_lines2("hello.txt");
    for line in lines {
        println!("{}", line);
    }

    // big file
    // let lines = read_buffer("hello.txt").unwrap();
    // for line in lines {
    //     println!("{}", line.unwrap());
    // }
    if let Ok(lines) = read_buffer("hello.txt") {
        for line in lines {
            println!("big--->{}", line.unwrap());
        }
    }
}

fn open_file() -> Result<File, std::io::Error> {
    let p = Path::new("hello.txt");
    let f = File::open(p);
    f
}

fn read_file() -> Result<String, std::io::Error> {
    let mut f = open_file()?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    Ok(s)
}

fn read_lines() -> Result<Vec<String>, std::io::Error> {
    let mut f = open_file()?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    let v: Vec<String> = s.lines().map(|x| x.to_string()).collect();
    Ok(v)
}

fn read_lines2(filename: &str) -> Vec<String> {
    // let mut result = Vec::new();

    //for line in read_to_string(filename).unwrap().lines() {
    //    result.push(line.to_string());
    //}
    //result

    read_to_string(filename)
        .unwrap()
        .lines()
        .map(String::from)
        .collect()
}

// big file efficient read buffer

fn read_buffer<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    let reader = io::BufReader::new(file);
    Ok(reader.lines())
}
