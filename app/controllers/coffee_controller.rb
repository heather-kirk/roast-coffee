class CoffeeController < ApplicationController
  
  get '/coffee/new' do
    #new order for the coffee 
    erb :new 
  end
  
  get '/coffees' do
    #track all their orders
    @coffees = Coffee.all
    erb :coffees
  end 
  
  post '/coffees' do
    @coffees = Coffee.create(flavor: params[:flavor], price: params[:price])
    @coffees.save
    redirect '/'
  end 
  
  get '/coffees/:id' do
    @coffee = Coffee.find(params[:id])
    erb :show
  end 
  
  get '/coffees/:id/edit' do
    #edit order
    @coffee = Coffee.find(params[:id])
    erb :edit
  end 
  
  patch '/coffees/:id/edit' do
    #user submitted info to edit the order
    @coffee = Coffee.find(params[:id])
    @coffee.update
    @coffee.save
    redirect '/coffees/:id'
  end 
  
  delete '/coffees/:id/edit' do
    #delete order
    @coffee = Coffee.find(params[:id])
    @coffee.delete
    redirect '/coffees'
  end 
end 