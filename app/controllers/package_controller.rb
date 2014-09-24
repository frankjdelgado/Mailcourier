class PackageController < ApplicationController

	before_action :authenticate_user!
	
	before_filter :require_admin, :only => [:new, :create, :update, :destroy]
	
	def index
		@packages = current_user.agency.packages.agency_pending.page(params[:page]) 
	end

	def show
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
					:shipping_cost 	=> params[:package][:shipping_cost],
					:date_added 	=> Time.now,
					:ref_number 	=> "MC-"+SecureRandom.hex(10).to_s,
					:sender_id		=> sender.first.id,
					:receiver_id	=> receiver.first.id,
				)

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

		if @package.save
			if @package.is_delivered?
				flash[:notice] = "Package marked as delivered succesfully!"
			else
				flash[:notice] = "Package marked as arrived succesfully!"
			end
		else
			flash[:alert] = "There was an error with your request. Please, try again."
		end
		redirect_to package_index_path
	end
end