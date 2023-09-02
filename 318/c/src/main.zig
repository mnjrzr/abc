const std = @import("std");
const abclib = @import("abclib");

const Type = u32;

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const n = try getInt(stdin, ' ', Type);
    const d = try getInt(stdin, ' ', Type);
    const p = try getInt(stdin, '\n', Type);
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var alloc = gpa.allocator();
    var array = std.ArrayList(Type).init(alloc);
    var total: u64 = 0;
    for (0..n) |i| {
        var delim: u8 = ' ';
        if (i == n - 1) {
            delim = '\n';
        }
        const f = try getInt(stdin, delim, Type);
        total += f;
        try array.append(f);
    }

    // std.debug.print("{d} {d}", .{array.items, total});

    const maxPass: Type = @divTrunc(n, d) + 1;
    // std.debug.print("{d}", .{maxPass});
    for (1..maxPass + 1) |i| {
        const ii: u32 = @truncate(i);
        const total_with_passs = try getTotalWithPass(ii * d, ii * p, array);
        if (total > total_with_passs) {
            total = total_with_passs;
        }
    }

    std.debug.print("{d}", .{total});
    array.clearAndFree();
}

fn getInt(stdin: std.fs.File, delimiter: u8, comptime T: type) !T {
    return try abclib.stringToInt(try abclib.readStringFromStdinUntilDelimiter(stdin, delimiter), T);
}

fn getTotalWithPass(days: Type, price: Type, array: std.ArrayList(Type)) !u64 {
    // std.debug.print("{d} {d}\n", .{ days, price });
    var sorted_array = try array.clone();
    defer sorted_array.clearAndFree();
    std.sort.heap(Type, sorted_array.items, {}, std.sort.desc(Type));
    var total: u64 = 0;
    if (days > sorted_array.items.len) {
        return total + price;
    }
    for (sorted_array.items[days..sorted_array.items.len]) |i| {
        total += i;
    }
    return total + price;
}
