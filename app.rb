require "sinatra/base"
require "sinatra/reloader"
require 'player'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions

  get '/' do
    erb (:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

    get '/play' do
      @player_1_name = $player_1.name
      @player_2_name = $player_2.name
      # @player_2_name.hit_points = $player_2.hit_points
      erb (:play)
    end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    # @player_1_name.attack(@player_2_name)
    erb (:attack)
    # sleep = 15
    # redirect '/play'
  end


  run! if app_file == $0
end

# start the server if ruby file executed directly
