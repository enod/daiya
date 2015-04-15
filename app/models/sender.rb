class Sender < ActiveRecord::Base
	validates_presence_of :source_address
	validates_presence_of :destination_address
	validates_presence_of :arrival
	validates_presence_of :phone
	validates_presence_of :mail
	validates_presence_of :user_id
	belongs_to :user
end
