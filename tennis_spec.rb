require File.join(File.dirname(__FILE__ ), 'tennis')

describe TennisGame1 do
  def new_game(gameClass, p1_name, p2_name, p1_points, p2_points)
  # it ' increase p1 points' do
  #   game = TennisGame1.new('abc', 'def')
  #   game.won_point('abc')
  #   expect(game).to eq 'x'
  # end
    game = gameClass.new(p1_name, p2_name)
    (0..[p1_points, p2_points].max).each do |p|
      if p < p1_points
        game.won_point(p1_name)
      end
      if p < p2_points
        game.won_point(p2_name)
      end
    end
    game
    # TennisGame1.won_point(game.player1Name)
  end

  describe 'won#point' do
    it 'increases p1 points' do
      game = new_game(TennisGame1, 'abc', 'def', 1, 2)
      expect(game).to have_attributes(player1Name:'abc', player2Name: 'def', p1_points: 1, p2_points: 3)


    end


  end
end
