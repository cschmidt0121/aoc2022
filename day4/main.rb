file_path = File.expand_path('../input.txt', __FILE__)
assignments = File.read(file_path)
                  .split("\n")
                  .map { |line| line.split(",") }
                  .map { |pair| pair
                                  .map { |range| range.split("-").map(&:to_i) }
                  }

def is_subset(x, y)
  # Return true if x is a subset of y
  x[0] >= y[0] && x[1] <= y[1]
end


puts "Part 1"
puts assignments.sum {|a| is_subset(a[0], a[1]) || is_subset(a[1], a[0])  ? 1 : 0}

def has_overlap(x,y)
  x_rng = (x[0]..x[1])
  y_rng = (y[0]..y[1])
  return x_rng.any? {|x_item| y_rng.cover? x_item}
end

puts "Part 2"
puts assignments.sum {|a| has_overlap(a[0], a[1])  ? 1 : 0}