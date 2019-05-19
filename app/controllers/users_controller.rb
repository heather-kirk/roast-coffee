class UsersController < ApplicationController
  
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      @user = current_user
      session[:user_id] = @user.id 
      redirect '/coffees/new'
    end
  end
  
  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect '/coffees/new'
    else 
      redirect '/signup'
    end 
  end 
  
  get '/login' do
    if !logged_in?
    erb :'/users/login'
  else 
      @user = current_user
      session[:user_id] = @user.id 
      redirect '/coffees'
    end
  end 
  
  post '/login' do
    if params[:username] != "" && params[:password] != ""
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect '/coffees'
    else 
      redirect '/login'
    end 
  end 
  
  get '/logout' do 
    session.clear
    redirect '/'
  end 
end 