import http from "http";

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("Hello from TypeScript\n");
});

server.listen(8080, () => {
    console.log("TypeScript server on port 8080");
});
