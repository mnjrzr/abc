const std = @import("std");
const abclib = @import("abclib");

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const n = try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, ' '), i32);
    const m = try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, ' '), i32);
    const p = try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, '\n'), i32);
    const from_first: i32 = n - m;
    if (from_first < 0) {
        std.debug.print("{d}", .{0});
        std.os.exit(0);
    }
    const total: i32 = @divTrunc(from_first, p);
    std.debug.print("{d}", .{total + 1});
    // std.debug.print("{d} {d} {d}", .{n, m ,p});
}
