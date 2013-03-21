class Tag < ActiveRecord::Base
	validates_presence_of :name

	has_many :taggings

	has_many :posts, through: :taggings

	def self.tokens(query)
		tags = where("name like ?", "%#{query}%")
		if tags.empty?
			[{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
		else
			tags
		end
	end

	def self.ids_from_tokens(tokens)
		tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
	end
end
