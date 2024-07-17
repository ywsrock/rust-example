use std::io;

use tokio::fs::File;
use tokio::io::{AsyncBufReadExt, AsyncReadExt, BufReader};

#[tokio::main]
async fn main() -> io::Result<()> {
    //read_to_buf().await?;
    //read_lines().await?;
    read_lines().await?;
    Ok(())
}

#[allow(dead_code)]
async fn read_to_buf() -> io::Result<()> {
    let mut file = File::open("frmMain.frm").await?;
    let mut buf = vec![0; 1024];

    // Read the whole file in memory
    loop {
        let n = file.read(&mut buf).await?;
        if n == 0 {
            break;
        }
        //println!("{:?}", &buf[..n]);
        // bytes to string
        let s = String::from_utf8_lossy(&buf[..n]);
        println!("{}", s);
    }
    Ok(())
}

// Read file line by line
async fn read_lines() -> io::Result<()> {
    let file = File::open("frmMain.frm").await?;
    let reader = BufReader::with_capacity(1023, file);

    let mut lines = reader.lines();
    while let Some(line) = lines.next_line().await? {
        println!("{}", line);
    }
    Ok(())
}
