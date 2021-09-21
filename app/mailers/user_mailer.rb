class UserMailer < Devise::Mailer

	helper :email
  include Devise::Controllers::UrlHelpers # eg. `confirmation_url`
  default template_path: 'users/mailer'
  #layout  'mailer'


end
