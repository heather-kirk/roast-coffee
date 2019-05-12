require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end 
  
    get '/' do
      erb :index
    end 
    
  helpers do 
  
  def is_logged_in?(session)
    !!session
  end 
  
  def current_user(session)
    @user = User.find_by(session[:user_id])
  end 
 end 
end 