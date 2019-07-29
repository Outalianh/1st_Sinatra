require 'gossip'


class ApplicationController < Sinatra::Base
	
	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
		erb :new_gossip
	end

	post '/gossips/new/' do
  	Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
  	redirect '/'
	
	end

	get '/gossips/:index/' do

 		erb :show, locals: {gossips: Gossip.find(params['index'].to_i)}
  
	end

	get '/gossips/id/edit/' do
		erb :edit
	end

	post 'gossips/id/edit/' do
		Gossip.new("#{params["gossip_edit_author"]}", "#{params["gossip_edit_content"]}").update
	redirect 'gossips/:index/'
	end

	
end