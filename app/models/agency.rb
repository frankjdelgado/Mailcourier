class Agency < ActiveRecord::Base

	validates :location, presence: true, uniqueness: true

	self.table_name = 'agencies'
	has_many :packages
end