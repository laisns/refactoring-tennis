class Player
  attr_reader :points, :name

  def initialize(name)
    @name, @points = name, 0
  end

  def won_point
    @points += 1
  end

end

class TennisGame
  def all
    x == y < 3
  end

  def deuce
    x == y >= 3
  end

  def won
    (x >= 4 || y >=4) and (x - y).abs > 1
  end

  def advantage
    x >= 3 and y >= 3 and (x - y).abs > 1
  end

  def distinct
    x != y and x < 4 and y < 4
  end
end



###################################################
# player1 = Player.new('john')
# player2 = Player.new('eric')
# game = TennisGame.new(player1, player2)
# 3.times do
#   player2.won_point
# end
# puts game.score(player1.points, player2.points)
############# returns  'Love-Forty' ###############

