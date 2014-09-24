class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :packages
	has_many :packages_sent, class_name: "Package", foreign_key: "sender_id"
	has_many :packages_received, class_name: "Package", foreign_key: "receiver_id"

  	belongs_to :agency

  	# Validations
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	
end
