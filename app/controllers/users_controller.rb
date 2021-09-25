class UsersController < ApplicationController
    before_action :authenticate_user_presence!


	def dashboard
		@products = Product.all
	end
end