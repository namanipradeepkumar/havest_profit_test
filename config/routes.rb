Rails.application.routes.draw do
  root "pages#home"

  resources :contracts, :inputs, :products, :crops, :fields, :charts, :contract_types
  resources :pages
  get "pages/home"
  get "dashboard", to: "pages#dashboard"
  get "field", to: "pages#field"
  #get "blog", to: "pages#blogposts"
  #get "blog", to: "http://harvestprofit.flywheelsites.com"

  devise_for :users
  devise_for :consultants
  devise_for :admin_users

  ActiveAdmin.routes(self)

  # constraints Constraints::CustomSubdomain do
     get '(*path)' => 'application#blog', :constraints => {subdomain: 'blog'}
  # end

  #get '/blog' => redirect("http://harvestprofit.herokuapp.com/blog/")
  #get '/blog' => redirect("http://localhost:3000/blog/"), as: 'blog'
  get '/blog' => redirect("http://harvestprofit.brilliancetechsols.com/")
end
