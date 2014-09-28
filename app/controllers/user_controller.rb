class UserController < ApplicationController

	before_action :authenticate_user!

	before_filter :require_admin

	def index
        @users = User.operators.page(params[:page])
    end

    def show
    	@user = User.operators.find(params[:id])
    end

    def new
    	@user = User.new
    end

    def edit
        @user = User.operators.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(permit_params)
            redirect_to users_admin_index_path, notice: I18n.t('operator_updated_success')
        else
        	flash[:alert] = @user.errors.full_messages.to_sentence
            render :edit
        end

    end

    def create
        @user = User.new(user_params)
        @user.role = 1
        if @user.save
            redirect_to new_users_admin_path, notice: I18n.t('operator_added_success')
        else
        	flash[:alert] = @user.errors.full_messages.to_sentence
            render :new
        end
    end

    def destroy
		@user = User.operators.find(params[:id])

		if @user.destroy
			flash[:notice] = I18n.t('operator_deleted_success')
			redirect_to users_admin_index_path
		else
			flash[:error] = I18n.t('request_error')
			redirect_to users_admin_index_path
		end
	end

    private

	def user_params
		params.require(:user).permit(:username, :agency_id,:email, :password, :password_confirmation)
	end

	def permit_params
		params.require(:user).permit!
	end

end
