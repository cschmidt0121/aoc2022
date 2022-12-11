file_path = File.expand_path('../input.txt', __FILE__)
input     = File.read(file_path)

rows = input.split("\n")
rounds = rows.map { |x|
  x.split(' ')
}



CHOICE_MAP = {"X" => 0, "Y" => 1, "Z" => 2, "A" => 0, "B" => 1, "C" => 2}
SCORE_MATRIX = [
  [3, 6, 0],
  [0, 3, 6],
  [6, 0, 3]
]

def score_round(them, me)
  them = CHOICE_MAP[them]
  me = CHOICE_MAP[me]
  SCORE_MATRIX[them][me] + me + 1
end


OUTCOME_MAP = {"X" => 0, "Y" => 3, "Z" => 6}
def score_round_p2(them, outcome)
  them = CHOICE_MAP[them]
  outcome = OUTCOME_MAP[outcome]
  me = SCORE_MATRIX[them].find_index    { |i| i == outcome}
  outcome + me + 1
end

puts "Part 1"
puts rounds.reduce(0) { |total, round| total + score_round(round[0], round[1])}

puts "Part 2"
puts rounds.reduce(0) { |total, round| total + score_round_p2(round[0], round[1])}