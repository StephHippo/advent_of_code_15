santa_strings = open('day05_input.txt').read.split("\n")


vowels = /[aeiou]/
repeated = /(.)\1/
forbidden = ["ab", "cd", "pq", "xy"]


# PART I
num_nice = 0
santa_strings.each do |santa_string|
  three_vowels = santa_string.scan(vowels).length >= 3
  yes_repeated = santa_string.match(repeated)
  no_forbidden = true
  forbidden.each do |forbid|
  	no_forbidden = false if santa_string.include? forbid
  end
  num_nice += 1 if (three_vowels && yes_repeated && no_forbidden)
end

puts num_nice

#PART II
num_nice = 0

sandwiched = /(.)[^\1](?:\1)/
doubled_up = /(.{2}).*(?:\1)/
santa_strings.each do |santa_string|
  is_sandwiched = santa_string.match(sandwiched) 
	is_doubled_up = santa_string.match(doubled_up)
  num_nice += 1 if (is_sandwiched && is_doubled_up)
end

puts num_nice
