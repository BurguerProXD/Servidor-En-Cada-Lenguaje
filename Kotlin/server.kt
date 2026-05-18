import java.io.OutputStream
import java.net.ServerSocket

fun main() {
    val server = ServerSocket(8080)
    println("Kotlin server on port 8080")
    while (true) {
        val client = server.accept()
        val out: OutputStream = client.getOutputStream()
        val response = "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Kotlin"
        out.write(response.toByteArray())
        client.close()
    }
}
