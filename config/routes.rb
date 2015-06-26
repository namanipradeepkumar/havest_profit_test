Rails.application.routes.draw do
  root "pages#home"

  resources :contracts, :inputs, :products, :crops, :fields, :charts, :contract_types

  get "pages/home"
  get "dashboard", to: "pages#dashboard"
  get "field", to: "pages#field"

  devise_for :users
  devise_for :consultants
  devise_for :admin_users

  ActiveAdmin.routes(self)
end
