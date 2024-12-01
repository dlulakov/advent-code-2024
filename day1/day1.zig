const std = @import("std");

const LocationList = []const i32;

fn compare(a: i32, b: i32) std.sort.Order {
    if (a < b) {
        return std.sort.Order.Less;
    } else if (a > b) {
        return std.sort.Order.Greater;
    } else {
        return std.sort.Order.Equal;
    }
}

fn calculate_total_distance(left: LocationList, right: LocationList) i32 {
    // Ensure both lists are the same length
    if (left.len != right.len) {
        std.debug.print("Error: The lists must have the same length.\n", .{});
        return -1; // Return an error code if lengths mismatch
    }

    // Sort both lists (ascending order)
    const left_sorted = left;
    const right_sorted = right;
    std.mem.sort(i32, left_sorted, compare);
    std.mem.sort(i32, right_sorted, compare);

    // Calculate the total distance
    var total_distance: i32 = 0;
    for (left_sorted, 0..) |value, idx| {
        const diff = std.math.abs(value - right_sorted[idx]);
        total_distance += diff;
    }

    return total_distance;
}

pub fn main() void {
    // const allocator = std.heap.page_allocator;

    // Example input lists
    const left_list: LocationList = &[_]i32{ 3, 4, 2, 1, 3, 3 };
    const right_list: LocationList = &[_]i32{ 4, 3, 5, 3, 9, 3 };

    // Calculate the total distance
    const distance = calculate_total_distance(left_list, right_list);
    if (distance != -1) {
        std.debug.print("The total distance between the lists is: {}\n", .{distance});
    }
}
