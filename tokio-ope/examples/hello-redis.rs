use bytes::Bytes;
use mini_redis::{client, Result};
use tokio::sync::{mpsc, oneshot};

#[derive(Debug)]
enum Command {
    Get {
        key: String,
        resp: Responder<Option<Bytes>>,
    },
    Set {
        key: String,
        val: Bytes,
        resp: Responder<()>,
    },
}

type Responder<T> = tokio::sync::oneshot::Sender<Result<T>>;

#[tokio::main]
async fn main() {
    let (tx, mut sx) = mpsc::channel(32);
    let tx1 = tx.clone();

    let t1 = tokio::spawn(async move {
        let (txx1, rx1) = oneshot::channel();
        let cmd = Command::Set {
            key: "hello".to_string(),
            val: "world".into(),
            resp: txx1,
        };

        tx1.send(cmd).await.unwrap();
        let res = rx1.await;
        println!("SET {:?} -> OK", res);
    });

    let tx2 = tx.clone();
    let t2 = tokio::spawn(async move {
        let (txx2, rx2) = oneshot::channel();

        tx2.send(Command::Get {
            key: "hello".to_string(),
            resp: txx2,
        })
        .await
        .unwrap();

        let res = rx2.await;
        println!("GET {:?} -> {:?}", "hello", res);
    });

    let mng = tokio::spawn(async move {
        let mut client = client::connect("172.29.202.13:6379").await.unwrap();
        while let Some(cmd) = sx.recv().await {
            use Command::*;

            match cmd {
                Get { key, resp } => {
                    let res = client.get(&key).await;
                    let _ = resp.send(res);
                    //println!("GET {:?} -> {:?}", key, res);
                }

                Set { key, val, resp } => {
                    let res = client.set(&key, val.clone()).await;
                    let _ = resp.send(res);
                }
            }
        }
    });

    t1.await.unwrap();
    t2.await.unwrap();
    mng.await.unwrap();
}
