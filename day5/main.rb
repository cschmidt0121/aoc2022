file_path = File.expand_path('../input.txt', __FILE__)
state_txt, instructions = File.read(file_path).split("\n\n")
instructions = instructions.split("\n")

def parse_state(state_txt)
  lines = state_txt.split("\n")
  lines.pop
  stacks = Array.new(9) { Array.new(0) }
  lines.each do |line| (1..33)
                         .step(4) {|i| unless line[i] == " " then stacks[i/4].push(line[i]) end}
  end
  return stacks
end

def execute_instruction(instruction, stacks, multicrate: false)
  num_crates, source_i, dest_i = instruction.match(/(\d+).*?(\d+).*?(\d+)/).captures.map {|i| i.to_i}
  source_i -= 1
  dest_i -= 1
  if multicrate then
    stacks[dest_i] = stacks[source_i].slice(0, num_crates) + stacks[dest_i]
    stacks[source_i] = stacks[source_i].drop(num_crates)
  else
    (1..num_crates).each { stacks[dest_i].insert(0, stacks[source_i][0]); stacks[source_i] = stacks[source_i].drop(1)}
  end


end

puts "Part 1"
stacks = parse_state(state_txt)
instructions.each do |instruction|
  execute_instruction(instruction, stacks)
end

puts stacks.sum(""){|stack| stack[0]}

puts "Part 2"
stacks = parse_state(state_txt)

instructions.each do |instruction|
  execute_instruction(instruction, stacks, multicrate: true)
end

puts stacks.sum(""){|stack| stack[0]}