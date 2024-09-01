require_relative 'lib/knight'

knight = Knight.new
starting_square = [0, 0]
ending_square = [7, 7]
path = knight.knight_moves(starting_square, ending_square)
puts path.inspect
