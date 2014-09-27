class UserController < ApplicationController

	before_action :authenticate_user!

	before_filter :require_admin

	def index
        @users = User.operators
    end

    def show
    	@user = User.operators.find_by_id(params[:id])
    end

    def new
    	@user = User.new
    end

    def edit
        @user = User.operators.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to new_users_admin_path, notice: "Updated Operator data succesfully"
        else
        	flash[:alert] = @user.errors.full_messages.to_sentence
            render :edit
        end
    end

    def create
        @user = User.new(user_params)
        @user.role = 1
        if @user.save
            redirect_to new_users_admin_path, notice: "Operator succesfully created!" 
        else
        	flash[:alert] = @user.errors.full_messages.to_sentence
            render :new
        end
    end

    private

	def user_params
		params.require(:user).permit(:username, :agency_id,:email, :password, :password_confirmation)
	end

end
