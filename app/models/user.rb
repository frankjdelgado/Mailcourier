class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :package_relationships
	has_many :package_sent,   -> {where(sender: true)}, class_name: 'Package', through: :packages_relationships
  	has_many :package_received, -> {where(sender: false)},  class_name: 'Package', through: :packages_relationships

  	# Validations
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
end
