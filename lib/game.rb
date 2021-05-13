require_relative 'player.rb'

class Game
  attr_reader :current_turn

  def self.create(player_1, player_2)
  @game = Game.new(player_1, player_2)
  end

  def self.instance
  @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @current_turn = opponent_of(current_turn)
  end

  def game_over?
  losing_players.any?
end

def loser
  losing_players.first
end

  private

  def losing_players
   @players.select { |player| player.hit_points <= 0 }
 end

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
