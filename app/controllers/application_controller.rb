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
    
     get '/discover' do
    erb :'/discover'
  end 
  
  get '/location' do
    erb :'/location'
  end 
  
  get '/about' do
    erb :'/about'
  end 
    
  helpers do 
  
  def logged_in?
    !!session[:user_id]
  end 
  
  def current_user
    @user = User.find_by_id(session[:user_id])
  end 
 end 
end 