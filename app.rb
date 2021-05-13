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
    if @game.current_turn == @game.player_1
      @game.attack(@game.player_2)
    else
      @game.attack(@game.player_1)
    end
    erb (:attack)
  end

  post '/switch_turn' do
    $game.switch_turn
    redirect('/play')
  end


  run! if app_file == $0
end

# start the server if ruby file executed directly
