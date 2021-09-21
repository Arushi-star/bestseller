class ProductsController < ApplicationController

  def index 
  	@products = Product.all

  end

  def new
    @product = Product.new 
  end 

  def create
  	@product = Product.new(product_params)
  	 if @product.save
  	 	flash[:notice] = " Product Sucessfully Created"
  	 	redirect_to root_path
  	 end	
  end


  private
   def product_params
   	 params.require(:product).permit(:id, :name,:description,:user_id)
   end
end
