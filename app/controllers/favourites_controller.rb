class FavouritesController < ApplicationController
  def update    
   
  	favourite = Favourite.where(user: current_user, product: Product.find_by_id(params[:product_id]))
  	 unless favourite.present?
       Favourite.create(user_id:current_user.id,product: Product.find_by_id(params[:product_id]))
       flash[:notice] = "Successfully Added To Favourites"
  	 else
      favourite.destroy_all
      flash[:notice] = "Successfully Removed From Favourites"
  	 end 	
     @product_id = params[:product_id]
  	 respond_to do |format|
  	 	format.html {}
  	 	format.js {} 
  	 end
  end

  def favourites_details
    if params[:id].present?
      @product_detail = Product.find_by_id(params[:id]) 
    end  
  end

end
