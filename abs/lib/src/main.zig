const std = @import("std");

pub fn readStringFromStdinUntilDelimiter(stdin: std.fs.File, delimiter: u8) ![]u8 {
    var buf: [64]u8 = undefined;
    var fbs = std.io.fixedBufferStream(buf[0..]);
    try stdin.reader().streamUntilDelimiter(fbs.writer(), delimiter, buf.len);
    return fbs.getWritten();
}

pub fn stringToInt(s: []u8, comptime T: type) !T {
    return try std.fmt.parseInt(T, s, 10);
}

// https://stackoverflow.com/questions/73019693/looping-over-an-integer-range-in-zig#:~:text=zig%20has%20no%20concept%20of%20integer%20range%20loops,%7C_%2C%20i%7C%20%7B%20std.debug.print%20%28%22%20%7Bd%7Dn%22%2C.%20%7Bi%7D%29%3B%20%7D
pub fn range(len: usize) []const void {
    return @as([*]void, undefined)[0..len];
}
