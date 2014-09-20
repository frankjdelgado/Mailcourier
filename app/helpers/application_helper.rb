module ApplicationHelper

	def devise_flash
		if controller.devise_controller? && resource.errors.any?
			messages = resource.errors.full_messages
			flash.now[:error] = messages.uniq!
			flash.now[:error] = messages.join(", ")
		end
	end
	
end
