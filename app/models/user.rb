class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :packages

  	# Validations
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, presence: true, uniqueness: true
end
