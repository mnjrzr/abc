const std = @import("std");
const abclib = @import("abclib");

pub fn main() !void {
    const stdin = std.io.getStdIn();

    const a_string = try abclib.readStringFromStdinUntilDelimiter(stdin, '\n');
    const a = try abclib.stringToInt(a_string);

    const b_string = try abclib.readStringFromStdinUntilDelimiter(stdin, ' ');
    const b = try abclib.stringToInt(b_string);

    const c_string = try abclib.readStringFromStdinUntilDelimiter(stdin, '\n');
    const c = try abclib.stringToInt(c_string);

    const s_string = try abclib.readStringFromStdinUntilDelimiter(stdin, '\n');

    std.debug.print("{d} {s}", .{ a + b + c, s_string });
}

test "simple test" {}
