const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn();

    const a_string = try readStringFromStdinUntilDelimiter(stdin, '\n');
    const a = try stringToInt(a_string);

    const b_string = try readStringFromStdinUntilDelimiter(stdin, ' ');
    const b = try stringToInt(b_string);

    const c_string = try readStringFromStdinUntilDelimiter(stdin, '\n');
    const c = try stringToInt(c_string);

    const s_string = try readStringFromStdinUntilDelimiter(stdin, '\n');

    std.debug.print("{d} {s}", .{ a + b + c, s_string });
}

fn readStringFromStdinUntilDelimiter(stdin: std.fs.File, delimiter: u8) ![]u8 {
    var buf: [64]u8 = undefined;
    var fbs = std.io.fixedBufferStream(buf[0..]);
    try stdin.reader().streamUntilDelimiter(fbs.writer(), delimiter, buf.len);
    return fbs.getWritten();
}

fn stringToInt(s: []u8) !i32 {
    return try std.fmt.parseInt(i32, s, 10);
}

test "simple test" {}
