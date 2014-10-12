class RateController < ApplicationController

	before_filter :require_admin, :only => [:new, :create, :update, :destroy, :index, :show, :edit]
	
	def calculate

		# Get shipping cost
		shipping_cost = get_shipping_cost(params[:height],params[:weight],params[:depth],params[:width],params[:value])
		
		respond_to do |format|
			msg = { :status => "ok", :message => shipping_cost}
			format.json  { render :json => msg }
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
            redirect_to rate_index_path, notice: I18n.t('rate_added_success') 
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
			if !@active.save
				flash[:alert] = I18n.t('request_error') 
			end
		else
			if @rate.save
				flash[:notice] = I18n.t('rate_activated_success')
			else
				flash[:alert] = @rate.errors.full_messages.to_sentence
			end
	    end
        redirect_to rate_index_path
	end

	def destroy
		@rate = Rate.find(params[:id])

		if @rate.destroy
			flash[:notice] = I18n.t('rate_deleted_success')
			redirect_to rate_index_path
		else
			flash[:error] = I18n.t('request_error') 
			redirect_to rate_index_path
		end
	end

	private

	def rate_params
		params.require(:rate).permit(:package, :cost)
	end

end
