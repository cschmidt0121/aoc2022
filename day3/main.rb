require 'set'
file_path = File.expand_path('../input.txt', __FILE__)
input     = File.read(file_path)

sacks = input.split("\n")

# Priority is index in array + 1
PRIORITIES = (("a".."z").to_a + ("A".."Z").to_a)
def process_sack(sack)
  first, second = sack.chars.each_slice(sack.length / 2).map(&:join)
  in_common = first.chars.reduce(Set[]) {|item_types, item| item_types.add(item)}.intersection(second.chars.reduce(Set[]) {|item_types, item| item_types.add(item)})
  return in_common.sum {|item| PRIORITIES.find_index(item) + 1}
end

puts "Part 1"
puts sacks.sum {|sack| process_sack(sack)}

def process_sacks(sacks)
  # Process 3 sacks at a time
  sets = []
  sacks.each { |sack|
    sets.push sack.chars.reduce(Set[]) { |item_types, item| item_types.add(item) }
  }
  return sets[0].intersection(sets[1]).intersection(sets[2]).sum {|item| PRIORITIES.find_index(item) + 1}
end

puts "Part 2"
puts sacks.each_slice(3).sum {|group| process_sacks(group)}