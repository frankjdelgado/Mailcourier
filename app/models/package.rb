class Package < ActiveRecord::Base
	
	validates :description, presence: true
	validates :height, presence: true, numericality: true
	validates :weight, presence: true, numericality: true
	validates :depth, presence: true, numericality: true
	validates :agency_id, presence: true, numericality: true
	validates :ref_number, presence: true, uniqueness: true
	validates :shipping_cost, presence: true, numericality: true

	has_many :package_relationships
	has_many :package_sent, -> {where(sender: true)}, class_name: 'User', through: :package_relationships
  	has_many :package_received, -> {where(sender: false)},  class_name: 'User', through: :package_relationships
	belongs_to :agency
end