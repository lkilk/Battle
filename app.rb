require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions

  get '/' do
    erb (:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

    get '/play' do
      @game = $game
      # @player_2_name.hit_points = $player_2.hit_points
      erb (:play)
    end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turn
    erb (:attack)
  end


  run! if app_file == $0
end

# start the server if ruby file executed directly
