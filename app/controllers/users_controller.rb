class UsersController < ApplicationController

	def dashboard
		@products = Product.all
	end
end