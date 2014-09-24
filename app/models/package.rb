class Package < ActiveRecord::Base
	
	validates :description, presence: true
	validates :height, presence: true, numericality: true
	validates :weight, presence: true, numericality: true
	validates :depth, presence: true, numericality: true
	validates :agency_id, presence: true, numericality: true
	validates :ref_number, presence: true, uniqueness: true
	validates :shipping_cost, presence: true, numericality: true
	validates :receiver_id, presence: true, numericality: true
	validates :sender_id, presence: true, numericality: true

	belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
	belongs_to :sender, class_name: "User", foreign_key: "sender_id"
	belongs_to :agency

	scope :pending, -> { where(status: 0) }
	scope :arrived, -> { where(status: 1) }
	scope :delivered, -> { where(status: 2) }
	scope :agency_pending, -> { where(status: 0) || where(status: 1)}

	def status_human
		if status == 0
			'pending'
		elsif status == 1
			'arrived'
		else
			'delivered'
		end	
	end

	def is_pending?
		if status == 0
			return true
		else
			return false
		end
	end

	def is_arrived?
		if status == 1
			return true
		else
			return false
		end
	end

	def is_delivered?
		if status == 2
			return true
		else
			return false
		end
	end

end