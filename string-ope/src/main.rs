fn main() {

    // &str is a string slice
    let params = "こんにちわ　私は　キティちゃんです。";
    println!("Params: {}", params);

    //  split_whitespace() splits the string by whitespace
    //  split_whitespace() returns an iterator, so we can use for loop to iterate over it
    for word in params.split_whitespace().rev() {
        println!("{}", word);
    }


    // chars() returns an iterator over the characters of a string slice
    let mut cs: Vec<char> = params.chars().collect();
    println!("Chars: {:?}", cs);
    // push a new character to the vector
    cs.push('!');
    println!("Chars: {:?}", cs);
    // sort the vector
    cs.sort();
    // dedup() removes consecutive duplicate elements from the vector
    cs.dedup();
    println!("Chars: {:?}", cs);


    let ss = "   Hello, world!   ".to_string();
    // trim space
    let trimmed = ss.trim();
    println!("Trimmed: {}", trimmed);

    let match_str: &[char] = &['H','e'];
    // trim the string by the characters in the match_str
    let s = trimmed.trim_matches(match_str);
    println!("Trimmed: {}", s);

    let s = s.trim_matches(|c: char| c == 'o' || c == 'l');
    println!("Trimmed: {}", s);

    let rp = s.replace("world", "Rust");
    println!("Replaced: {}", rp);


}
