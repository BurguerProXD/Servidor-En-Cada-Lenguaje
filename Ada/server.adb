with GNAT.Sockets; use GNAT.Sockets;

procedure Server is
   Server  : Socket_Type;
   Client  : Socket_Type;
   Address : Sock_Addr_Type;
   Channel : Stream_Access;
begin
   Create_Socket (Server);
   Set_Socket_Option (Server, Socket_Level, (Reuse_Address, True));
   Address.Addr := Any_Inet_Addr;
   Address.Port := 8080;
   Bind_Socket (Server, Address);
   Listen_Socket (Server);
   Ada.Text_IO.Put_Line ("Ada server on port 8080");
   loop
      Accept_Socket (Server, Client, Address);
      Channel := Stream (Client);
      String'Write (Channel, "HTTP/1.0 200 OK" & ASCII.CR & ASCII.LF &
                    "Content-Type: text/plain" & ASCII.CR & ASCII.LF &
                    ASCII.CR & ASCII.LF & "Hello from Ada");
      Close_Socket (Client);
   end loop;
end Server;
