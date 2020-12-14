Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :incomes
  resources :spendings
  get 'users', to: 'users#index'

end
