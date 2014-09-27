class Rate < ActiveRecord::Base

	validates :package, presence: true, numericality: true
	validates :cost, presence: true, numericality: true

	paginates_per 15
	scope :active, -> { where(status: 1) }
	scope :inactive, -> { where(status: 0) }

	def is_active?
		if status == 1
			return true
		else
			return false
		end
	end
end
