class FavouritesController < ApplicationController
  def update

  	favourite = Favourite.where(user: current_user, product: Product.find_by_id(params[:product_id]))
  	 unless favourite.present?
       Favourite.create(user_id:current_user.id,product: Product.find_by_id(params[:product_id]))
  	 else
      favourite.destroy_all
  	 end 	
     @product_id = params[:product_id]
  	 respond_to do |format|
  	 	format.html {}
  	 	format.js {}
  	 end
  end

  def index
    @likes = Favourite.joins(:product).where("product_id=?")
  end
end
