class ProductsController < ApplicationController 

  def index 
  end

  def new
    @product = Product.new 
  end 

  def create
  	@product = Product.new(product_params)
  	 if @product.save
  	 	flash[:notice] = " Product Sucessfully Created"
  	 	redirect_to dashboard_path
     else
      render 'new'
  	 end	
  end

  def show

    @product = Product.find_by_id(params[:id])
     if @product.present?
       redirect_to product_path(:id)
     else 
       flash[:alert] = "Something found Wrong"
       render 'show'
     end
  end  

  def edit
    if params[:id].present?
      @product = Product.find_by_id(params[:id])
     end
  end

  def update
    if params[:id].present?
      @product = Product.find_by_id(params[:id])
      if @product.present?
        @product.update(product_params)
        redirect_to dashboard_path
      else
      render 'edit'
      end 
    end   
  end

  def destroy
    @product = Product.find_by_id(params[:id])
     if @product.present?
      @product.destroy
      redirect_to dashboard_path
     end 
  end 


  private
   def product_params
   	 params.require(:product).permit(:id, :name,:description,:user_id,:image,:color,:price)
   end
end
