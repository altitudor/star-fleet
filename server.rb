require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.

  @starships = Ship.all

  erb :'starships/index'
end

get '/starships/:id' do
  
  @starship = Ship.find_by(id: params["id"])

  erb :'starships/show'
end

get '/new' do
  erb :'starships/new'
end
