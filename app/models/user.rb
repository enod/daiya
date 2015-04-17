class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  has_many :senders, dependent: :destroy
  has_many :negotiations, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :requests, dependent: :destroy
end
