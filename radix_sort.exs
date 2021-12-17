defmodule Sort do
  def radix_sort(list) do
    list
      |> stringify
      |> sort_recursively(max_digits(list) - 1)
      |> Enum.map(&String.to_integer/1)
  end

  def sort_recursively(list, -1), do: list
  def sort_recursively(list, position) do
    list
      |> sort_on(position)
      |> sort_recursively(position - 1)
  end

  def sort_on(list, position) do
    list
      |> bucketize(position)
      |> List.flatten
  end

  def bucketize(list, position) do
    Enum.map 0..10, fn(i) ->
      Enum.filter list, fn(x) ->
        x |> String.at(position) == "#{i}"
      end
    end
  end

  def stringify(list) do
    len = list |> max_digits

    Enum.map list, fn(num) ->
      num_length = num |> Integer.digits |> length
      prefix = "0" |> String.duplicate(len - num_length)

      "#{prefix}#{num}"
    end
  end

  def max_digits(list) do
    list
      |> Enum.max
      |> Integer.digits
      |> length
  end
end

defmodule Test do
  def test_cases do
    [
      [
        [ 170, 45, 75, 90, 2, 802, 2, 66 ],
        [ 2, 2, 45, 66, 75, 90, 170, 802 ]
      ],
      [
        [ 8902, 67_832, 12, 1000, 4_002 ],
        [ 12, 1000, 4_002, 8902, 67_832 ]
      ]
    ]
  end

  def radix_sort do
    Enum.each test_cases(), fn(test_case) ->
      [original_aray | [expected_result]] = test_case

      result = Sort.radix_sort(original_aray)

      if result === expected_result do
        IO.puts "Worked well on"
      else
        IO.puts "Failed at"
      end

      IO.inspect original_aray
      IO.inspect result
      IO.puts "---------------"
    end
  end
end

Test.radix_sort
