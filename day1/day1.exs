input = File.read!("/home/dainii/aoc/AoC_2024/day1/test_input.txt")

list_1 = []
list_2 = []

split_input = String.split(input, "\n")

defmodule Aoc do
  def split_and_add_to_list(input, list1, list2) do
    split_input = String.split(input, " ", trim: true)
  end
end

Recursion.add_numbers_to_lists(split_input, length(split_input))
