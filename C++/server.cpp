#include <iostream>
#include <string>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>

int main() {
    int server_fd = socket(AF_INET, SOCK_STREAM, 0);
    int opt = 1;
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
    struct sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(8080);
    bind(server_fd, (struct sockaddr *)&address, sizeof(address));
    listen(server_fd, 3);
    std::string response = "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from C++";
    while (true) {
        int client = accept(server_fd, nullptr, nullptr);
        send(client, response.c_str(), response.size(), 0);
        close(client);
    }
    return 0;
}
