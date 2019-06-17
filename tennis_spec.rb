require File.join(File.dirname(__FILE__ ), 'tennis')
require 'pry'


describe TennisGame do
  describe 'start new game' do
    it 'creates new players' do
      p1 = Player.new('player 1')
      p2 = Player.new('player 2')
      game = TennisGame.new(p1, p2)
      expect(game.score(p1.points,p2.points)).to eq('Love - All')
    end
  end

  describe 'at least one player won points' do
    it 'informs current score' do
      p1 = Player.new('player 1')
      p2 = Player.new('player 2')
      game = TennisGame.new(p1, p2)
      p2.won_point
      p1.won_point
      p2.won_point
      expect(game.score(p1.points, p2.points)).to eq('Fifteen - Thirty')
    end
  end

  describe 'a player won the game' do
    it 'informs when a player wins' do
      p1 = Player.new('player 1')
      p2 = Player.new('player 2')
      game = TennisGame.new(p1, p2)
      4.times do
        p1.won_point
      end
      expect(p1.points).to eq(4)
      expect(game.score(p1.points, p2.points)). to eq('Win for player 1')
    end
  end
end
