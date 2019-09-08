require 'sinatra/base'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    # "Testing infrastructure working!"
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    erb :play
  end

  run! if app_file == $0
end
