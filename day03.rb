require 'set'

directions = open("day03_input.txt").read.split("")


# PART I
legend_x = {">":1, "<":-1, "v":0, "^": 0}
legend_y = {">":0, "<":0, "v":-1, "^": 1}

coords = [0,0]
delivered_houses = Set.new []

directions.each do |direction|
	x = coords[0] 
	y = coords[1]
	new_x = x + legend_x[direction.to_sym]
	new_y = y + legend_y[direction.to_sym]
	new_coords = [new_x, new_y]
	delivered_houses.add(new_coords)
	coords = new_coords
end

print delivered_houses.length

# PART II - take turns
santa_coords = [0,0]
robo_coords = [0,0]
delivered_houses = Set.new []

def update_coords(old_coords, movement_x, movement_y)
  new_x = old_coords[0] + movement_x
  new_y = old_coords[1] + movement_y
  return [new_x, new_y]
end

directions.each_with_index do |direction, i|
  if i % 2 == 1
    new_coords = update_coords(santa_coords, legend_x[direction.to_sym], legend_y[direction.to_sym])
    delivered_houses.add(new_coords)
    santa_coords = new_coords
  end
  if i % 2 == 0
    new_coords = update_coords(robo_coords, legend_x[direction.to_sym], legend_y[direction.to_sym])
    delivered_houses.add(new_coords)
    robo_coords = new_coords
  end
end

print delivered_houses.length