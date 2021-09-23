Rails.application.routes.draw do
    devise_for :users,
  :path_names => {
    :sign_up => 'sign_up',
    :sign_in => 'sign_in',
    :sign_out => 'sign_out',
    :password => 'password',
     }, controllers: { sessions: 'user/sessions', :registrations => 'user/registrations', :passwords => 'user/passwords'}
  devise_scope :user do 
   #get 'user/sign_up' => 'user/registrations#sign_up', :as => :sign_up
   get 'user/sign_in' =>  'user/sessions#sign_in' , :as => :sign_in
  end 
  root to: "homes#index"
	resources :products
	get "user/dashboard" => "users#dashboard" , as: 'dashboard'
  post "/products/new" => "products#create" , as: :save_product
  patch "/products/edit/id" => "products#update" , as: :update_product
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
