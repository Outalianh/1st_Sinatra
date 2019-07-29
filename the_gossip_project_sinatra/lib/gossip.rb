require 'csv'

class Gossip
	attr_accessor :author, :content, :index, :editing_author, :edited_content

	def initialize(author, content)
		@author = author
		@content = content
		@edited_content = edited_content
		@editing_author = editing_author
	end




	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << ["#{@author}", "#{@content}"]
  	end
  end	

  def self.all
  	all_gossips = [] 
  		CSV.read("./db/gossip.csv").each do |csv_line| # va chercher chacune des lignes du csv do
  			all_gossips << Gossip.new(csv_line[0], csv_line[1])  # all_gossips << gossip qui vient d'être créé
  		end

  	return all_gossips #on retourne un array rempli d'objets Gossip
	end

	def self.find(index)
		self.all[index]
	end

	def update
		CSV.open("./db/gossip.csv", "ab") do |csv|
		csv << ["#{@editing_author}", "#{@edited_content}"]
		end
	end

end