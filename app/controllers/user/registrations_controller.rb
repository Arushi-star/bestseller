class User::RegistrationsController < Devise::RegistrationsController
  

	def new 
	  response = {"status"=> false, "message"=>''}
        #debugger
	    if request.xhr?
	        # response = super
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

    def create
      super
    end

end