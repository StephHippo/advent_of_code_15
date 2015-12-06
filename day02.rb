orders = open('day02_input.txt').read.split("\n")

#Part I
total_paper = 0
orders.each do |order|
  dimensions = order.split('x')
  dimensions = dimensions.map{|dim| dim.to_i}
  side1 = dimensions[0] * dimensions[1]
  side2 = dimensions[1] * dimensions[2]
  side3 = dimensions[2] * dimensions[0]
  slack = [side1, side2, side3].min
  surface_area = 2*side1 + 2*side2 + 2*side3
  total_paper += surface_area + slack
end

puts total_paper


#Part II
total_ribbon = 0
orders.each do |order|
  dimensions = order.split('x')
  dimensions = dimensions.map{|dim| dim.to_i}
  side1 = 2*dimensions[0] + 2*dimensions[1]
  side2 = 2*dimensions[1] + 2*dimensions[2]
  side3 = 2*dimensions[2] + 2*dimensions[0]
  smallest_perimeter = [side1, side2, side3].min
  volume = dimensions.inject(:*)
  total_ribbon += volume + smallest_perimeter
end

puts total_ribbon