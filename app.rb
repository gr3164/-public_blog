require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:blog.db"

class Client < ActiveRecord::Base
	validates :content, presence: true
end

class Comment < ActiveRecord::Base
end

before do
	@clients = Client.all
end

get '/' do
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
  c = Client.new params[:client]
  if c.save
  		erb :index
  else
  		@error = c.errors.full_messages.first
  		erb :new
  end
end