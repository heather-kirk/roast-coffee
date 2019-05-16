class CoffeeController < ApplicationController
  
  get '/coffee/new' do
    #new order for the coffee 
    if logged_in? && current_user
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffees/new' 
    else
      redirect 'users/login'
    end 
  end
  
  get '/coffees' do
    #track all their orders
    if logged_in? && current_user
      @coffees = Coffee.all
      @user = current_user
      session[:user_id] = @user.id
      erb :coffees
    else 
      redirect 'users/login'
    end 
  end 
  
  post '/coffees' do
    @coffees = Coffee.create(flavor: params[:flavor], price: params[:price])
    @coffees.save
    redirect '/'
  end 
  
  get '/coffees/:id' do
    if logged_in? && current_user
      @coffee = Coffee.find(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffees/show'
    else 
      redirect 'users/login'
    end 
  end
  
  get '/coffees/:id/edit' do
    #edit order
    if logged_in? && current_user
      @coffee = Coffee.find(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffees/edit'
    else
      redirect
      erb :'users/login'
    end 
  end
  
  patch '/coffees/:id/edit' do
    #user submitted info to edit the order
    if logged_in? && current_user
      @coffee = Coffee.find(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      @coffee.update
      @coffee.save
      redirect '/coffees/:id'
    else 
      redirect '/login'
    end 
  end
  
  delete '/coffees/:id/edit' do
    #delete order
    if logged_in? && current_user
      @coffee = Coffee.find(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      @coffee.delete
      redirect '/coffees'
    else 
      redirect '/login'
    end 
  end 
  
 
end 