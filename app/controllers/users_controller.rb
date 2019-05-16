class UsersController < ApplicationController
  
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      @user = current_user
      session[:user_id] = @user.id 
      redirect '/coffees'
    end
  end
  
  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      @user = User.create(username: params[:username], password: params[:password])
      binding.pry
      session[:user_id] = @user.id
      redirect '/coffees'
    else 
      redirect '/signup'
    end 
  end 
  
  get '/login' do
    erb :'/users/login'
  end 
  
  post '/login' do
    @user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/login'
    else 
      redirect '/'
    end 
  end 
  
  get '/logout' do 
    session.clear
    redirect '/'
  end 
end 