class Sender < ActiveRecord::Base
	
	validates_presence_of :source_address
	validates_presence_of :destination_address
	validates_presence_of :arrival
	validates_presence_of :phone
	validates_presence_of :mail
	validates_presence_of :user_id
	belongs_to :user
	
	geocoded_by :source_address, :latitude => :latitude, :longitude => :longitude
	geocoded_by :destination_address, :latitude => :latitude2, :longitude => :longitudde2
	
	def update_coordinates
  		geocode
  		[latitude, longitude, latitude2, longitudde2]
	end

	after_validation :geocode  
	
end
