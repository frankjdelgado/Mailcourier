class Package < ActiveRecord::Base
	
	has_many :package_relationships
	has_many :package_sent, -> {where(sender: true)}, class_name: 'User', through: :package_relationships
  	has_many :package_received, -> {where(sender: false)},  class_name: 'User', through: :package_relationships
	belongs_to :agency

end