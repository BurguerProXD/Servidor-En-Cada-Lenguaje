import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print("Dart server on port 8080");
  await for (var request in server) {
    request.response.write("Hello from Dart");
    await request.response.close();
  }
}
