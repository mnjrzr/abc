const std = @import("std");
const abclib = @import("abclib");

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const a_string = try abclib.readStringFromStdinUntilDelimiter(stdin, ' ');
    const a = try abclib.stringToInt(a_string, i16);
    const b_string = try abclib.readStringFromStdinUntilDelimiter(stdin, '\n');
    const b = try abclib.stringToInt(b_string, i16);

    if (@mod(a * b, 2) == 0) {
        std.debug.print("Even", .{});
    } else {
        std.debug.print("Odd", .{});
    }
}

test "simple test" {}
