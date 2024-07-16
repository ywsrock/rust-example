use std::{
    collections::HashMap,
    sync::{Arc, Mutex},
};

use bytes::Bytes;
use mini_redis::{Command, Connection, Frame};
use tokio::net::{TcpListener, TcpStream};

type Db = Arc<Mutex<HashMap<String, Bytes>>>;

#[tokio::main]
async fn main() {
    let listener = TcpListener::bind("172.29.202.13:6379").await.unwrap();

    let db = Arc::new(Mutex::new(HashMap::new()));

    loop {
        let (socket, _) = listener.accept().await.unwrap();
        let db = db.clone();

        tokio::spawn(async move {
            process(socket, db).await;
        });
    }
}

async fn process(socket: TcpStream, db: Db) {
    let mut connection = Connection::new(socket);

    while let Some(frame) = connection.read_frame().await.unwrap() {
        let response = match Command::from_frame(frame).unwrap() {
            Command::Set(cmd) => {
                let mut db = db.lock().unwrap();

                db.insert(cmd.key().to_string(), cmd.value().clone());
                let response = Frame::Simple("OK".to_string());
                response
            }
            Command::Get(cmd) => {
                let mut db = db.lock().unwrap();

                if let Some(value) = db.get(cmd.key()) {
                    Frame::Bulk(value.clone().into())
                } else {
                    Frame::Null
                }
            }
            cmd => {
                let response = Frame::Error(format!("unimplemented: {:?}", cmd));
                response
            }
        };

        connection.write_frame(&response).await.unwrap();
    }
}
