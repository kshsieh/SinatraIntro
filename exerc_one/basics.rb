path = File.expand_path "../", __FILE__

require 'sinatra'
require 'shotgun'

require "#{path}/basics.rb"

get '/' do
  "Hello, World!"
end

get '/about' do
  'A bit about me.'
end

get '/hello/:name' do
	"Hello #{params[:name]}." 
end

get '/more/*' do
	params[:splat]
end

get '/form' do
	erb :form
end

post '/form' do
	"You said '#{params[:message]}'"
end

get '/secret' do
	erb :secret
end

post '/secret' do 
	params[:secret].reverse
end

get '/decrypt/:secret' do
	params[:secret].reverse
end

not_found do
	halt 404, 'page not found'
end