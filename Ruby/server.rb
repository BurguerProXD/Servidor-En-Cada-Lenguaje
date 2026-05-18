require 'socket'

server = TCPServer.new('127.0.0.1', 8080)
puts "Ruby server on port 8080"
loop do
  client = server.accept
  client.write "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Ruby"
  client.close
end
