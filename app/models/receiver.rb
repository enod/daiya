class Receiver < ActiveRecord::Base
	validates_presence_of :stuff
	validates_presence_of :source_address
	validates_presence_of :destination_address
	validates_presence_of :from
	validates_presence_of :to
	validates_presence_of :user_id
	belongs_to :user
	has_attached_file :image

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Зөвхөн зураг оруулах ёстой!"

	

	validates :image, attachment_presence: true
	


	geocoded_by :source_address, :latitude => :latitude1, :longitude => :longitude1
	geocoded_by :destination_address, :latitude => :latitude2, :longitude => :longitude2
	after_validation :geocode

	has_many :requests, dependent: :destroy
end
