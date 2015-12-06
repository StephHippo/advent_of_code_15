directions = open('day01_input.txt').read

# Final floor position
floor = 1
directions.each do |direction|
  floor+=1 if direction == '('
  floor-=1 if direction == ')'
end

puts floor

# First position where he goes to the basement
floor = 1
directions.each_with_index do |direction, i|
  floor+=1 if direction == '('
  floor-=1 if direction == ')'
  if floor < 0
    puts i
    break
  end
end