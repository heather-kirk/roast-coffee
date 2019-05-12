class User < ActiveRecord::Base
has_many :coffees
has_secure_password

helpers do 
  
  def is_logged_in?(session)
    !!session
  end 
  
  def current_user(session)
    @user = User.find_by(session[:user_id])
  end 
end 