class Knight
  def initialize
    @moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def knight_moves(starting_square, ending_square)
    queue = [[starting_square, []]]
    visited = Set.new([starting_square])

    until queue.empty?
      current_position, path = queue.shift
      return path + [ending_square] if current_position == ending_square

      valid_moves(current_position).each do |move|
        next if visited.include?(move)

        visited.add(move)
        queue.push([move, path + [current_position]])
      end
    end

    nil
  end

  def valid_moves(position)
    x, y = position
    @moves.map { |dx, dy| [x + dx, y + dy] }
          .select { |new_x, new_y| valid_position?(new_x, new_y) }
  end

  def valid_position?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end
end
