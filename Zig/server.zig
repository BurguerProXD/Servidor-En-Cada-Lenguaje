const std = @import("std");

pub fn main() !void {
    var server = try std.net.Address.listenIp(std.net.Address.initIp4(.{127,0,0,1}, 8080), .{ .reuse_address = true });
    std.debug.print("Zig server on port 8080\n", .{});
    while (true) {
        var client = try server.accept();
        _ = try client.write("HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Zig");
        client.file.close();
    }
}
