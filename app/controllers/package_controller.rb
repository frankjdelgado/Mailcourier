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

		@sender		= User.where(username: params[:sender]).first
		@receiver	= User.where(username: params[:receiver]).first

		@package = Package.new(
				:description	=> params[:package][:description],
				:weight 	  	=> params[:package][:weight],
				:height 		=> params[:package][:height],
				:depth 			=> params[:package][:depth],
				:value 			=> params[:package][:value],
				:agency_id 		=> params[:agency_id],
				:date_added 	=> Time.now,
				:shipping_cost 	=> 10,
				:ref_number 	=> "MC-"+SecureRandom.hex(10).to_s
			)
		
		@package.package_relationships.build(:user_id => @sender.id, :sender => true)
		@package.package_relationships.build(:user_id => @receiver.id, :sender => false)

		if @package.save
			flash[:notice] = "New Package added succesfully!"	
			redirect_to '/package/new'
		else
			render 'new'
		end
	end

end