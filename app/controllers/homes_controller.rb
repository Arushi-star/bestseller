class HomesController < ApplicationController
 # before_action :authenticate_user_presence!

	def index
		 @products = Product.paginate(page: params[:page], per_page: 5) 
	end 
end