class Rate < ActiveRecord::Base

	validates :package, presence: true, numericality: true
	validates :cost, presence: true, numericality: true
end
