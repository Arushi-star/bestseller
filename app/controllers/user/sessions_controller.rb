class User::SessionsController < Devise::SessionsController
  #before_action :authenticate_user_presence! , except: [:sign_in,:new,:create]

    
end