class HomeController < ApplicationController

	def index
		rate = Rate.last
		@packageRate = rate.package
		@costRate 	= rate.cost
	end

end
