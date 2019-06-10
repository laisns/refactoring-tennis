require_relative 'score'
class TennisGame
  include Score
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

  def score
    if @p1points < 4 and @p2points < 4 and @p1points + @p2points < 6
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1points]
      @p1points == @p2points ? s + "-All" : s + "-" + p[@p2points]
    else
      if @p1points == @p2points
        "Deuce"
      else
        s = @p1points > @p2points ? @player1Name : @player2Name
        (@p1points - @p2points) * (@p1points - @p2points) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end


###################################################
game = TennisGame.new('player1', 'player2')
4.times do
  game.won_point('player2')
end
# puts game.score
############# returns  'Love-Forty' ###############

game.check(game.p1points, game.p2points)
