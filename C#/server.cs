using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

class Server {
    static void Main() {
        TcpListener listener = new TcpListener(IPAddress.Any, 8080);
        listener.Start();
        Console.WriteLine("C# server on port 8080");
        while (true) {
            TcpClient client = listener.AcceptTcpClient();
            NetworkStream stream = client.GetStream();
            string response = "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from C#";
            byte[] buffer = Encoding.ASCII.GetBytes(response);
            stream.Write(buffer, 0, buffer.Length);
            client.Close();
        }
    }
}
