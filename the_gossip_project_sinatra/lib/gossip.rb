require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content


	def initialize(author, content)
		  	@author = author
		  	@content = content

	end 

	def save

		path =  "/home/yannick/Bureau/TheHackingProject/Semaine1/Jour21/the_gossip_project_sinatra/db/gossip.csv"
		  CSV.open( path, "ab") do |csv|
		    csv << [@author, @content]

		end
	end


	def self.all
	  all_gossips = []
	  path =  "/home/yannick/Bureau/TheHackingProject/Semaine1/Jour21/the_gossip_project_sinatra/db/gossip.csv"
	  CSV.read(path).each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips
	end


	def self.find (id)

		path =  "/home/yannick/Bureau/TheHackingProject/Semaine1/Jour21/the_gossip_project_sinatra/db/gossip.csv"
		#puts [id,  Gossip.all[id].author ,  Gossip.all[id].content ]
		return Gossip.all[id]

	end 



	def update(id)

		path =  "/home/yannick/Bureau/TheHackingProject/Semaine1/Jour21/the_gossip_project_sinatra/db/gossip.csv"
		CSV.read(path)[id][0] << [@author]
		CSV.read(path)[id][1] << [@content]


	end 



end # fin de la classe gossip

