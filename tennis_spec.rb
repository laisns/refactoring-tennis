require File.join(File.dirname(__FILE__ ), 'tennis')
require 'pry'

describe TennisGame1 do
  it 'creates new players' do
    game = TennisGame1.new('player1', 'player2')
    expect(game.score).to eq('Love-All')
  end

  it 'informs when a player wins' do
    game = TennisGame1.new('player1', 'player2')
    4.times do
      game.won_point('player1')
    end
    expect(game.instance_variable_get(:@p1points)).to eq(4)
    expect(game.score). to eq('Win for player1')
  end
end

describe TennisGame2 do
  it 'creates two new players' do
    game = TennisGame2.new('player1', 'player2')
    expect(game.score).to eq('Love-All')
  end

  it 'informs when a player wins' do
    game = TennisGame2.new('player1', 'player2')
    4.times do
      game.won_point('player2')
    end
    expect(game.instance_variable_get(:@p2points)).to eq(4)
    expect(game.score). to eq('Win for player2')
  end
end