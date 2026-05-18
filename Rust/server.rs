use std::io::Write;
use std::net::TcpListener;

fn main() -> std::io::Result<()> {
    let listener = TcpListener::bind("127.0.0.1:8080")?;
    println!("Rust server on port 8080");
    for stream in listener.incoming() {
        if let Ok(mut stream) = stream {
            let response = b"HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Rust";
            stream.write_all(response)?;
        }
    }
    Ok(())
}
