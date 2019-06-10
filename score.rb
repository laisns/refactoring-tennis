require_relative 'tennis.rb'
module Score
  SCORE = ['Love', 'Fifteen', 'Thirty', 'Forty']

  def check(p1, p2)
    puts "win for player #{game}" if game_won(p1, p2)
    puts 'Deuce' if deuce(p1, p2)
    puts "#{SCORE[p1]} - All " if all(p1, p2)
  end

  private

  def game_won(x, y)
    x >= 4 and x - y > 1 or y >= 4 and y - x > 1
  end

  def deuce(x, y)
    x == y and x >= 4
  end

  def all(x, y)
    x == y and x < 4
  end
end

# case check()
# when 1
# when 2
# when 3
# when 4