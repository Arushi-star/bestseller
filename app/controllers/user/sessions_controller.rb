class User::SessionsController < Devise::SessionsController
  before_action :authenticate_user_presence! , except: [:sign_in,:new,:create]

  	def sign_in
  		response = {"status" => false , "message" => ''}
   
  		if request.xhr?
  			resource = User.new
  			resource_name = :user
  			html_data = render_to_string(partial: 'new', :locals => {resource: resource, resource_name: resource_name})
  			response = {"status"=> true, "html_data"=>html_data,"message"=>''}
  		else
  		 
  		 flash[:error] = "error"
  	      response = {"status"=> false,"message"=> I18n.t('common.error')}
  	    end
  	    render :json => response   
      end


    def new 
    	super
    end

     def create
      user = User.find_by(email: params[:user][:email].downcase)
      if user.nil?
        flash[:error] =  I18n.t('devise.failure.not_found_in_database',authentication_keys: 'email')
        redirect_to root_path(signin:true)
      end  
      if user.present?  
        valid_password = user.valid_password?(params[:user][:password])
      else
        valid_password = false
      end
      if user.present? && valid_password.present?    
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully."
        redirect_to location: after_sign_in_path_for(resource)
      else  
        flash.now[:alert] = "There was something wrong with your login details."
        render 'new'
      end
    end
 
    def destroy
      session[:user_id] = nil
      flash[:notice] = "You have been logged out."
      redirect_to root_path
    end
end