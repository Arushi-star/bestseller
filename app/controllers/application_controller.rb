class ApplicationController < ActionController::Base
  	before_action :configure_permitted_parameters, if: :devise_controller?

	def authenticate_user_presence!
	   redirect_to root_path, notice: "You must sigin " unless user_signed_in?
    end


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :name, :email, :password, :phonenumber,:password_confirmation,:user_type_id])
    end

    def after_sign_in_path_for(resource)
	    dashboard_path
	  end 

    # def favourite_text(product_id)
    #   favourite_text = current_user.favourites.where(product_id: product_id ).present? ?  "Unfavourite" : "favourite"
    # end 

    # helper_method :favourite_text(product_id)
end
