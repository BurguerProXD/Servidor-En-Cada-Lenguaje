using Sockets

server = listen(8080)
println("Julia server on port 8080")
while true
    conn = accept(server)
    write(conn, "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Julia")
    close(conn)
end
