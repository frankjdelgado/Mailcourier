class RateController < ApplicationController
	
	def calculate
		
		# Get last system rate added
		rate = Rate.last

		# Get params for formula
		packageRate = rate.package.to_f
		costRate 	= rate.cost.to_f
		height 		= params[:height].to_f
		weight		= params[:weight].to_f
		depth		= params[:depth].to_f
		width		= params[:width].to_f
		value		= params[:value].to_f

		# calculate final cost
		shipping_cost = ((height*weight*depth*width)/packageRate) + (costRate*(value/100.0)) 

		shipping_cost = shipping_cost.round(2)
		# respond petition with final cost
		respond_to do |format|
			msg = { :status => "ok", :message => shipping_cost}
			format.json  { render :json => msg } # don't do msg.to_json
		end

	end

end
