class ApplicationController < ActionController::Base

	before_action :book_new
	before_action :configure_permitted_parameters, if: :devise_controller?




	def after_sign_in_path_for(resource)
		user_path(current_user)
	end



	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
	end

	def book_new
		@book_new = Book.new
	end

	def move_to_login
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end
end
