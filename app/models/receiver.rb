class Receiver < ActiveRecord::Base
	extend FriendlyId
	friendly_id :stuff, use: :slugged
	validates_presence_of :stuff
	validates_presence_of :source_address
	validates_presence_of :destination_address
	validates_presence_of :from
	validates_presence_of :to
	validates_presence_of :user_id
	belongs_to :user
	has_attached_file :image,
	:style => { :medium => "300x300>", :thumb => "100x100>" },
	:storage => :s3,
	:bucket  => ENV['S3_BUCKET_NAME'],
	:s3_credentials => {
		:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
		},
		:s3_permissions => 'private',
		:url => ":s3_domain_url"
		validates :image, presence: true
		validates :description, presence: false

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Зөвхөн зураг оруулна уу!"
	validates :image, attachment_presence: true
	


	geocoded_by :source_address, :latitude => :latitude1, :longitude => :longitude1
	geocoded_by :destination_address, :latitude => :latitude2, :longitude => :longitude2
	after_validation :geocode

	has_many :requests, dependent: :destroy
end
