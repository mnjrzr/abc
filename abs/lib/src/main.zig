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
