const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const s1 = try readInt(stdin);
    const s2 = try readInt(stdin);
    const s3 = try readInt(stdin);
    std.debug.print("{d}", .{s1 + s2 + s3});
}

fn readInt(stdin: std.fs.File) !i8 {
   const s = try stdin.reader().readByte();
   return try std.fmt.parseInt(i8, &[1]u8{s}, 10);
}
