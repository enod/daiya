class Receiver < ActiveRecord::Base
	validates_presence_of :stuff
	validates_presence_of :source_address
	validates_presence_of :destination_address
	validates_presence_of :from
	validates_presence_of :to
	validates_presence_of :user_id
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource

	geocoded_by :source_address, :latitude => :latitude1, :longitude => :longitude1
	geocoded_by :destination_address, :latitude => :latitude2, :longitude => :longitude2
	after_validation :geocode

	has_many :requests, dependent: :destroy
end
