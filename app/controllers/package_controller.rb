class PackageController < ApplicationController

	before_action :authenticate_user!
	
	before_filter :require_operator, :only => [:new, :create, :update, :destroy]
	
	before_filter :require_rates, :only => [:new, :create, :update]

	def index

		if current_user.is_member?
			if params[:search]
		    	@packages = current_user.packages.search_by_package(params[:search]).page(params[:page])
		    	@count = @packages.count
		    else
				@packages = current_user.packages.page(params[:page])
			end
		else
			if params[:search] 
				if params[:search_by] == 'user'
		    		@packages = Package.search_by_user(params[:search]).page(params[:page])
		    	elsif params[:search_by] == 'package'
		    		@packages = Package.search_by_package(params[:search]).page(params[:page])
		    	end
		    	@count = @packages.count
			else
				@packages = current_user.agency.packages.agency_pending.page(params[:page]) 
			end
		end
	end

	def show
		@package = Package.find(params[:id])
	end

	def new
		@package = Package.new
	end

	def create

		sender		= User.where(username: params[:sender])
		receiver	= User.where(username: params[:receiver])

		if sender.empty? || receiver.empty?
			flash[:error] = "Sender and Receiver must be valid usernames"
			@package = Package.new(
					:description	=> params[:package][:description],
					:weight 	  	=> params[:package][:weight],
					:height 		=> params[:package][:height],
					:width 			=> params[:package][:width],
					:depth 			=> params[:package][:depth],
					:value 			=> params[:package][:value],
					:agency_id 		=> params[:package][:agency_id],
					:shipping_cost 	=> params[:package][:shipping_cost],
				)
		else
			@package = Package.new(
					:description	=> params[:package][:description],
					:weight 	  	=> params[:package][:weight],
					:height 		=> params[:package][:height],
					:width 			=> params[:package][:width],
					:depth 			=> params[:package][:depth],
					:value 			=> params[:package][:value],
					:agency_id 		=> params[:package][:agency_id],
					:shipping_cost 	=> get_shipping_cost(params[:package][:height],params[:package][:weight],params[:package][:depth],params[:package][:width],params[:package][:value]),
					:date_added 	=> Time.now,
					:ref_number 	=> "MC-"+SecureRandom.hex(10).to_s,
					:sender_id		=> sender.first.id,
					:receiver_id	=> receiver.first.id,
				)

			# get_shipping_cost(params[:package][:height],params[:package][:weight],params[:package][:depth],params[:package][:width],params[:package][:value])
			if @package.save
				flash[:notice] = "New Package added succesfully!"	
				redirect_to new_package_path
				return
			else
				flash[:alert] = @package.errors.full_messages.to_sentence
			end
		end
		render :new
	end

	def update

		@package = Package.find(params[:id])

		@package.status = params[:status]

		if params[:status] == '1'
			@package.date_arrived = Time.now
		elsif params[:status] == '2'
			@package.date_delivered = Time.now
		end

		if @package.save
			if @package.is_delivered?
				flash[:notice] = "Package marked as delivereds succesfully!"
			else
				flash[:notice] = "Package marked as arrived succesfully!"
			end
		else
			flash[:alert] = "There was an error with your request. Please, try again."
		end
		redirect_to package_index_path
	end
end