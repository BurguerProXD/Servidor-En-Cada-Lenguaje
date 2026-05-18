import socket

HOST, PORT = '127.0.0.1', 8080
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((HOST, PORT))
    s.listen()
    print(f"Python server on {PORT}")
    while True:
        conn, _ = s.accept()
        with conn:
            conn.sendall(b"HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Python")
