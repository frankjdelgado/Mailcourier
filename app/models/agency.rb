class Agency < ActiveRecord::Base
	self.table_name = 'agencies'
	has_many :packages
end