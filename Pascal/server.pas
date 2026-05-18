program Server;
uses sockets, sysutils;

var
  ServerSock, ClientSock: LongInt;
  addr: TInetSockAddr;
  clientAddr: TInetSockAddr;
  len: socklen_t;
  response: AnsiString;
begin
  ServerSock := fpSocket(AF_INET, SOCK_STREAM, 0);
  addr.sin_family := AF_INET;
  addr.sin_port := htons(8080);
  addr.sin_addr.s_addr := INADDR_ANY;
  fpBind(ServerSock, @addr, SizeOf(addr));
  fpListen(ServerSock, 3);
  WriteLn('Pascal server on port 8080');
  response := 'HTTP/1.0 200 OK'#13#10'Content-Type: text/plain'#13#10#13#10'Hello from Pascal';
  while true do
  begin
    len := SizeOf(clientAddr);
    ClientSock := fpAccept(ServerSock, @clientAddr, @len);
    fpSend(ClientSock, PChar(response), Length(response), 0);
    CloseSocket(ClientSock);
  end;
end.
