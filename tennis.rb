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
   attr_reader :player1Name, :player2Name
  SCORE = %w(Love Fifteen Thirty Forty)

  def initialize(player1Name, player2Name)
    @p1Name = player1Name.name
    @p2Name = player2Name.name
  end

  def score(p1, p2)
    methods = %w(all_result deuce_result game_won_result
              advantage_result distinct_result)
    methods.each { |method| send(method, p1, p2) }
  end

  private

  def bigger_three(xpoints)
      xpoints >= 3
  end

  def bigger_four(xpoints)
     xpoints >= 4
  end

  def equal_points(xpoints, ypoints)
    xpoints == ypoints
  end

  def difference(xpoints, ypoints)
    (xpoints - ypoints).abs == 1
  end

  def p1_bigger(xpoints, ypoints)
    xpoints > ypoints
  end

  def distinct(x, y)
    [equal_points(x,y), bigger_four(x), bigger_four(y)].all?(false)
  end

  def distinct_result(x, y)
    puts "#{SCORE[x]} - #{SCORE[y]}" if distinct(x, y)
  end

  def game_won(x, y)
    [bigger_four(x), bigger_four(y)].any && [difference(x, y), equal_points(x,y)].all?(false)
  end

  def game_won_result(x, y)
    puts p1_bigger(x, y) ? "Win for #{@p1Name}" : "Win for #{@p2Name}" if game_won(x,y)
  end

  def deuce(x, y)
    equal_points(x,y) && bigger_three(x)
  end

  def deuce_result(x,y)
    puts 'Deuce' if deuce(x,y)
  end

  def all(x, y)
    equal_points(x,y) && ! bigger_three(x)
  end

  def all_result(x, y)
    puts "#{SCORE[x]} - All" if all(x,y)
  end

  def advantage(x, y)
    [bigger_three(x), bigger_three(y), difference(x, y)].all?(true)
  end

  def advantage_result(x, y)
    puts p1_bigger(x, y) ? "Advantage #{@p1Name}" : "Advantage #{@p2Name}" if advantage(x, y)
  end
end
###################################################
# player1 = Player.new('john')
# player2 = Player.new('eric')
# game = TennisGame.new(player1, player2)
# 3.times do
#   player2.won_point
# end
# player1.won_point
# game.score(player1.points, player2.points)
############# returns  'Love-Forty' ###############
