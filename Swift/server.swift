#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif

let sock = socket(AF_INET, SOCK_STREAM, 0)
var opt = 1
setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &opt, socklen_t(MemoryLayout<Int>.size))
var addr = sockaddr_in(sin_family: sa_family_t(AF_INET), sin_port: UInt16(8080).bigEndian, sin_addr: in_addr(s_addr: INADDR_ANY), sin_zero: (0,0,0,0,0,0,0,0))
bind(sock, unsafeBitCast(&addr, to: sockaddr?.self), socklen_t(MemoryLayout<sockaddr_in>.size))
listen(sock, 5)
print("Swift server on port 8080")
while true {
    let client = accept(sock, nil, nil)
    let response = "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Swift"
    response.withCString { bytes in
        send(client, bytes, strlen(bytes), 0)
    }
    close(client)
}
