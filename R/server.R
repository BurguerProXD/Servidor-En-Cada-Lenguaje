library(socket)
# socket es parte de R base, aunque puede requerir instalación de capacidades.
con <- socketConnection(port = 8080, server = TRUE, open = "r+")
cat("R server on port 8080\n")
while (TRUE) {
  client <- socketAccept(con)
  writeLines("HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from R", client)
  close(client)
}
