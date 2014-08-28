class User < ActiveRecord::Base
	has_and_belongs_to_many :packages

	# Validations
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
	validates :password, presence: true
end