class TennisGame

  attr_reader :p1points, :p2points

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    playerName == "player1" ? @p1points += 1 : @p2points += 1
  end

  def score(p1, p2)

    score = ['Love', 'Fifteen', 'Thirty', 'Forty']
    puts "#{score[p1]} - All" if all(p1, p2)
    puts 'Deuce' if deuce(p1, p2)
    puts p1 > p2 ? 'win for player 1' : 'win for player 2' if game_won(p1, p2)
    puts p1 > p2 ? 'advantage player 1' : 'advantage player 2' if advantage(p1, p2)
    puts "#{score[p1]} - #{score[p2]}" if distinct(p1, p2)

  end

  private

  def distinct(x, y)
    x != y and x < 4 and y < 4
  end

  def game_won(x, y)
    (x >= 4 || y >=4) and (x - y).abs > 1
  end

  def deuce(x, y)
    x == y and x >= 3
  end

  def all(x, y)
    x == y and x < 3
  end

  def advantage(x, y)
    x >= 3 and y >= 3 and (x-y).abs == 1
  end

end



###################################################
# game = TennisGame.new('player1', 'player2')
# 3.times do
#   game.won_point('player2')
# end
# puts game.score(game.p1points, game.p2points)
############# returns  'Love-Forty' ###############
