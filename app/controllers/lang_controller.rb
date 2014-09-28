class LangController < ApplicationController

	def set_lang
		I18n.locale = params[:locale] || I18n.default
		redirect_to :back
		rescue ActionController::RedirectBackError
		redirect_to root_path
	end

end
