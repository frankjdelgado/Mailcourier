class RateController < ApplicationController

	before_filter :require_admin, :only => [:new, :create, :update, :destroy, :index, :show, :edit]
	
	def calculate

		# Get shipping cost
		shipping_cost = get_shipping_cost(params[:height],params[:weight],params[:depth],params[:width],params[:value])
		
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

	def destroy
		@rate = Rate.find(params[:id])

		if @rate.destroy
			flash[:notice] = "Rate deleted succesfully"
			redirect_to rate_index_path
		else
			flash[:error] = "There was a problem with your request. Please, try again."
			redirect_to rate_index_path
		end
	end

	private

	def rate_params
		params.require(:rate).permit(:package, :cost)
	end

end
