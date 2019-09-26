Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "user/registrations"}
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'

  get 'search_funds', to: 'funds#search'
  resources :user_funds, only: [:create, :destroy]
end
