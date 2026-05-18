<?php
$server = stream_socket_server("tcp://0.0.0.0:8080", $errno, $errstr);
if (!$server) {
    die("$errstr ($errno)");
}
echo "PHP server on port 8080\n";
while ($client = stream_socket_accept($server, -1)) {
    fwrite($client, "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from PHP");
    fclose($client);
}
