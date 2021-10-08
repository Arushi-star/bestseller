class UsersController < ApplicationController
    before_action :authenticate_user_presence!


	def dashboard
	   @products = Product.paginate(page: params[:page], per_page: 5) 
	end

	
end