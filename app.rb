require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:blog.db"

class Client < ActiveRecord::Base
end

get '/' do
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
  "Hello World"
end