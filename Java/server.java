import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket server = new ServerSocket(8080);
        System.out.println("Java server on port 8080");
        while (true) {
            Socket client = server.accept();
            OutputStream out = client.getOutputStream();
            String response = "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Java";
            out.write(response.getBytes());
            client.close();
        }
    }
}
