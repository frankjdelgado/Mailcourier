class HomeController < ApplicationController

	def index
		rate = Rate.active.first

		# Check if rates exits
		if !rate.blank?
			@packageRate = rate.package
			@costRate 	= rate.cost
		else
			@packageRate = ' '
			@costRate 	= ' '
		end
	end

end
