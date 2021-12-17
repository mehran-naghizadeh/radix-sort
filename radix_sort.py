def radix_sort(ls):
  count = max_digits(ls)
  sorted = stringify_list(ls)

  for i in range(0, count):
    buckets = bucketize(flat_list, count - 1 - i)
    sorted = [item for sublist in buckets for item in sublist]

  return list(map(lambda x: int(x), sorted))

def bucketize(ls, position):
  mapped = map(
    lambda i: list(filter(lambda x: x[position] == str(i), ls)),
    range(0, 10)
  )

  return list(mapped)

def stringify_list(ls):
  length = max_digits(ls)
  mapped = map(lambda x: stringify(x, length), ls)

  return list(mapped)

def stringify(number, length):
  string = str(number)
  prefix = '0' * (length - len(string))

  return prefix + string

def max_digits(ls):
  return len(str(max(ls)))

def unit_test():
  test_cases = [
    [
      [170, 45, 75, 90, 2, 802, 2, 66],
      [2, 2, 45, 66, 75, 90, 170, 802]
    ],
    [
      [8902, 67832, 12, 1000, 4002],
      [12, 1000, 4002, 8902, 67832]
    ]
  ]

  for test_case in test_cases:
    original_array, expected_result = test_case

    sorted_array = radix_sort(original_array)

    print('Worked well for' if sorted_array == expected_result  else 'Failed on')
    print(original_array)
    print(sorted_array)
    print()

unit_test()
