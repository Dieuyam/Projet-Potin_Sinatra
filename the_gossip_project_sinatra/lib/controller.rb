require 'bundler'
Bundler.require
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  
	get '/' do
	  erb :index, locals: {gossips: Gossip.all}
	end


	get '/gossips/new/' do
	   erb :new_gossip
	 end


	  post '/gossips/new/' do
	  	#Gossip.new.save
	    #puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
	    #Gossip.new("super_auteur", "super gossip").save
	  puts "Salut, je suis dans le serveur"
	  puts "Ceci est le contenu du hash params : #{params}"
	  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
	  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
	  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
	   
	   Gossip.new(params["gossip_author"], params["gossip_content"]).save

	  redirect '/'

	  end


#get '/gossips/:id/' do
 

 # puts "Voici le numéro du potin que tu veux : #{params["id"]} !"



	 get '/gossips/:id/' do
	  erb :show, locals: {gossips: Gossip.find(params['id'].to_i)}
	end

	 get '/gossips/:id/edit/' do
	 	erb :edit
	  
	end



  #get '/' do
   # "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
  #end

  #run! if app_file == $0


end #Fin de la classe ApplicationController