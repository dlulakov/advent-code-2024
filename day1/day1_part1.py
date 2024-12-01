def read_file(file):
    with open(file, 'r') as file:
        left_arr = [];
        right_arr = [];
        for line in file:
            numbers = line.split();
            print(numbers);
            left_arr.append(int(numbers[0]));
            right_arr.append(int(numbers[1]));

    left_arr.sort();
    right_arr.sort();
    return (left_arr, right_arr)


if __name__ == "__main__":
    left, right = read_file('data.txt');
    sum = 0;
    for i in range(len(left)):
        sum += abs(left[i] - right[i]) 
    print(sum)
