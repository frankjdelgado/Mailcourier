class Agency < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true

	self.table_name = 'agencies'
	has_many :packages
end