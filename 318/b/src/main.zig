const std = @import("std");
const abclib = @import("abclib");

const Type = u8;

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const n = try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, '\n'), Type);
    var buf: [100][100]Type = std.mem.zeroes([100][100]Type);
    var total: u16 = 0;
    for (abclib.range(n)) |_| {
        const a = try getInt(stdin, ' ');
        const b = try getInt(stdin, ' ');
        const c = try getInt(stdin, ' ');
        const d = try getInt(stdin, '\n');
        for (a..b) |i| {
            for (c..d) |j| {
                if (buf[i][j] == 1) {
                    continue;
                }
                buf[i][j] = 1;
                total += 1;
            }
        }
    }
    std.debug.print("{d}", .{total});
}

fn getInt(stdin: std.fs.File, delimiter: u8) !Type {
    return try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, delimiter), Type);
}
