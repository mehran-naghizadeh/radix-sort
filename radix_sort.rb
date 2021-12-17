def radix_sort(list)
  count = max_digits(list)
  sorted = stringify(list)

  count.times do |i|
    sorted = bucketize(sorted, count - 1 - i).flatten
  end

  sorted.map(&:to_i)
end

def bucketize(list, position)
  (0..10).to_a.map do |i|
    list.filter { |x| x[position] == i.to_s }
  end
end

def stringify(list)
  length = max_digits(list)

  list.map do |number|
    prefix = '0' * (length - number.to_s.length)

    "#{prefix}#{number}"
  end
end

def max_digits(list)
  list.max.to_s.length
end

def unit_test
  test_cases = [
    [
      [170, 45, 75, 90, 2, 802, 2, 66],
      [2, 2, 45, 66, 75, 90, 170, 802]
    ],
    [
      [8902, 67_832, 12, 1000, 4_002],
      [12, 1000, 4_002, 8902, 67_832]
    ]
  ]

  test_cases.each do |test_case|
    original_array, expected_result = test_case

    sorted_array = radix_sort(original_array)

    puts sorted_array == expected_result ? 'Worked well for' : 'Failed on'
    puts original_array.to_s
    puts sorted_array.to_s
    puts('--------')
  end
end

unit_test
