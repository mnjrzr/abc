const std = @import("std");
const abclib = @import("abclib");

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const n = try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, '\n'), u8);
    for (abclib.range(n)) |_| {
        const a = try getInt(stdin, ' ');
        const b = try getInt(stdin, ' ');
        const c = try getInt(stdin, ' ');
        const d = try getInt(stdin, '\n');
        std.debug.print("{d} {d} {d} {d}", .{a, b, c, d});
    }
}

fn getInt(stdin: std.fs.File, delimiter: u8) !i8 {
    return try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, delimiter), i8);
} 
