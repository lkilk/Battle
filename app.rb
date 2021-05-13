require "sinatra/base"
require "sinatra/reloader"
require './lib/player.rb'

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
      @player_1 = $player_1
      @player_2 = $player_2
      # @player_2_name.hit_points = $player_2.hit_points
      erb (:play)
    end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    @player_1.attack(@player_2)
    erb (:attack)
  end


  run! if app_file == $0
end

# start the server if ruby file executed directly
