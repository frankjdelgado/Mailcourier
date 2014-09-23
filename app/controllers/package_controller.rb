class PackageController < ApplicationController

	before_action :authenticate_user!
	
	before_filter :require_admin, :only => [:new, :create, :update, :destroy]
	def index
	end

	def show
	end

	def new
		@package = Package.new
	end

	def create

		@sender		= User.where(username: params[:sender])
		@receiver	= User.where(username: params[:receiver])

		@package = Package.new(
				:description	=> params[:package][:description],
				:weight 	  	=> params[:package][:weight],
				:height 		=> params[:package][:height],
				:width 		=> params[:package][:width],
				:depth 			=> params[:package][:depth],
				:value 			=> params[:package][:value],
				:agency_id 		=> params[:agency_id],
				:date_added 	=> Time.now,
				:shipping_cost 	=> params[:shipping_cost],
				:ref_number 	=> "MC-"+SecureRandom.hex(10).to_s
			)
		
		packageCreated = @package.save

		if packageCreated && (@sender.empty? || @receiver.empty?)
			@package.destroy
			flash[:error] = "Sender and Receiver can't be blank"
		end

		if !packageCreated
			flash[:alert] = @package.errors.full_messages.to_sentence
		end

		if !packageCreated || @sender.empty? || @receiver.empty?
			render :new
		else
			@package.package_relationships.create(:user_id => @sender.first.id, :sender => true)
			@package.package_relationships.create(:user_id => @receiver.first.id, :sender => false)
			flash[:notice] = "New Package added succesfully!"	
			redirect_to new_package_path
		end

	end

end