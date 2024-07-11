use std::num::ParseIntError;


fn result() -> Result<i32, String> {
    Ok(42)
}

// map
fn result_map(first:&str, second:&str) -> Result<i32, ParseIntError> {
    first.parse::<i32>().map(|first_num| {
        second.parse::<i32>().map(|second_num| {
            first_num + second_num
        })
    }).unwrap()
}

// and_then
fn result_and_then(first:&str, second:&str) -> Result<i32, ParseIntError> {
    first.parse::<i32>().and_then(|first_num| {
        second.parse::<i32>().and_then(|second_num| {
            Ok(first_num + second_num)
        })
    })
}


// error alias
type OrgResult<T> = std::result::Result<T, ParseIntError>;

fn result_alias(first:&str, second:&str) -> OrgResult<i32> {
    first.parse::<i32>().and_then(|first_num| {
        second.parse::<i32>().and_then(|second_num| {
            Ok(first_num + second_num)
        })
    })
}

// ? operator
fn result_question_mark(first:&str, second:&str) -> OrgResult<i32> {
    let first_num = first.parse::<i32>()?;
    let second_num = second.parse::<i32>()?;
    Ok(first_num + second_num)
}

// get result from option
fn get_result_from_option(vec: Vec<&str>) -> Option<Result<i32,ParseIntError>> {
    vec.first().map(|first| {
        first.parse::<i32>().map(|first_num| {
            first_num * 2
        })
    })
}

// get Option from Result
fn get_option_from_result(vec: Vec<&str>) -> Result<Option<i32>,ParseIntError> {
    vec.first().map(|first| {
        first.parse::<i32>().map(|first_num| {
            Some(first_num * 2)
        })
    }).unwrap()
}

// get option from result 2
fn get_option_from_result2(vec: Vec<&str>) -> Result<Option<i32>,ParseIntError> {
     let opt = vec.first().map(|first| {
        first.parse::<i32>().map(|n| 2 * n)
    });

    opt.map_or(Ok(None), |r| r.map(Some))
}

fn main() {
    match result() {
        Ok(value) => println!("Got a value: {}", value),
        Err(message) => println!("Got an error: {}", message),
    }

    match result_map("10", "20") {
        Ok(value) => println!("Got a value: {}", value),
        Err(message) => println!("Got an error: {}", message),
    }

    match result_and_then("10", "20") {
        Ok(value) => println!("Got a value: {}", value),
        Err(message) => println!("Got an error: {}", message),
    }

    match result_alias("10a", "20") {
        Ok(value) => println!("Got a value: {}", value),
        Err(message) => println!("Got an error: {}", message),
    }

    match result_question_mark("10", "20") {
        Ok(value) => println!("Got a value: {}", value),
        Err(message) => println!("Got an error: {}", message),
    }

    match get_result_from_option(vec!["10", "20"]) {
        Some(Ok(value)) => println!("Got a value: {}", value),
        Some(Err(message)) => println!("Got an error: {}", message),
        None => println!("Got None"),
    }

    match get_option_from_result(vec!["20", "20"]) {
        Ok(Some(value)) => println!("Got a value: {}", value),
        Ok(None) => println!("Got None"),
        Err(message) => println!("Got an error: {}", message),
    }

    match get_option_from_result2(vec!["50", "20"]) {
        Ok(Some(value)) => println!("Got a value: {}", value),
        Ok(None) => println!("Got None"),
        Err(message) => println!("Got an error: {}", message),
    }
}
