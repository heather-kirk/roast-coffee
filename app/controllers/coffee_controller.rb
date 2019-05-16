class CoffeeController < ApplicationController
  
  get '/coffees' do
    #track all their orders
    if logged_in? && current_user
      @coffees = Coffee.all
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffee/coffees'
    else 
      redirect '/login'
    end 
  end 
  
  get '/coffees/new' do
    #new order for the coffee 
    if logged_in? && current_user
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffee/new' 
    else
      redirect '/login'
    end 
  end
  
  
  post '/coffees' do
    @coffees = Coffee.create(flavor: params[:flavor], price: params[:price])
    @coffees.save
    redirect '/coffees'
  end 
  
  get '/coffees/:id' do
    if logged_in? && current_user
      @coffee = Coffee.find_by_id(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffee/show'
    else 
      redirect '/login'
    end 
  end
  
  get '/coffees/:id/edit' do
    #edit order
    if logged_in? && current_user
      @coffee = Coffee.find_by_id(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      erb :'/coffee/edit'
    else
      erb :'users/login'
    end 
  end
  
    patch '/coffees/:id' do
    #user submitted info to edit the order
    if logged_in? && current_user
      @coffee = Coffee.find_by_id(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      @coffee.save
      redirect '/coffees/:id'
    else 
      redirect '/login'
    end 
  end
  
  get '/coffees/:id/delete' do
    #delete order
    if logged_in? && current_user
      @coffee = Coffee.find_by_id(params[:id])
      @user = current_user
      session[:user_id] = @user.id
      @coffee.delete
      redirect '/coffees'
    else 
      redirect '/login'
    end 
  end 
  
 
end 