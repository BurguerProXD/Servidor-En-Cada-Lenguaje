package main

import (
    "fmt"
    "net"
)

func main() {
    ln, err := net.Listen("tcp", ":8080")
    if err != nil {
        panic(err)
    }
    fmt.Println("Go server on port 8080")
    for {
        conn, err := ln.Accept()
        if err != nil {
            continue
        }
        conn.Write([]byte("HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Go"))
        conn.Close()
    }
}
