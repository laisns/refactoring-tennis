require File.join(File.dirname(__FILE__ ), 'tennis')
require 'pry'

describe TennisGame do
  it 'creates new players' do
    game = TennisGame.new('player1', 'player2')
    expect(game.score).to eq('Love-All')
  end

  it 'informs when a player wins' do
    game = TennisGame.new('player1', 'player2')
    4.times do
      game.won_point('player1')
    end
    expect(game.p1points).to eq(4)
    expect(game.score). to eq('Win for player1')
  end
end
