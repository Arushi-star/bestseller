module FavouritesHelper
	
	 def favourite_text(product_id)
	 	
      favourite_text = current_user.favourites.where(product_id: product_id ).present? ?  "Unfavourite" : "favourite"
    end 

end
