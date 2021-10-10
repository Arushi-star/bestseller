class ProductsController < ApplicationController
   before_action :authenticate_user_presence! , except: [:search]  

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
     else
       redirect_to dashboard_path
       flash[:alert] = "Please fix the error!"
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

  def like
    if current_user.present?
      like = LikeDislikeProduct.where("user_id=? && product_id=?", current_user.id, params[:product_id])
      if like.present?
        like.like_dislike_status == true ? like.update(like_dislike_status: false) : like.update(like_dislike_status: true)
        @favourite_exists = false
      else
         LikeDislikeProduct.create(user_id:current_user.id,product_id: params[:product_id],like_dislike_status: true)
         @favourite_exists = true
      end
    else
      flash[:alert] = "Something went wrong"
    end
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def search
    @products = Product.where('name LIKE ? ', "%" + params[:q]+ "%" )    
  end
 

  
  private
   def product_params
   	 params.require(:product).permit(:id, :name,:description,:user_id,:color,:price, :category_types,images:[])
   end
end
