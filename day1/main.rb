file_path = File.expand_path('../input.txt', __FILE__)
input     = File.read(file_path)

# "" becomes 0
calories = input.split("\n").map(&:to_i)

def sum_calories(array)
  array.reduce([0]) { |sums, num| num.zero? ? sums + [0] : sums.take(sums.length - 1) + [sums.pop + num]}
end

summed = sum_calories(calories)

puts 'Part 1:'
puts summed.max

puts 'Part 2:'
puts summed.sort.reverse.take(3).sum
