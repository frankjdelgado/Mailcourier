class RateController < ApplicationController

	before_filter :require_admin, :only => [:new, :create, :update, :destroy, :index, :show, :edit]
	
	def calculate
		
		# Get last system rate added
		rate = Rate.active.first

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

	def index
		@rates = Rate.all.page(params[:page])
	end

	def new
		@rate = Rate.new
	end

	def create
		@rate = Rate.new(rate_params)
        if @rate.save
            redirect_to rate_index_path, notice: "New rates created succesfully!" 
        else
        	flash[:alert] = @rate.errors.full_messages.to_sentence
            render :new
        end
	end

	def update
		@rate = Rate.find(params[:id])

		@rate.status = params[:status]

		# Get Current active
		@active = Rate.active.first

		if !@active.blank?
			# Deactivate
			@active.status = 0
			if @active.save
				if @rate.save
					flash[:notice] = "Rate activated succesfully!"
		        else
		        	flash[:alert] = @rate.errors.full_messages.to_sentence
		        end
			else
				flash[:alert] = "There was an error with your request. Please, try again."
			end
		end

        redirect_to rate_index_path
	end

	private

	def rate_params
		params.require(:rate).permit(:package, :cost)
	end

end
