Rails.application.routes.draw do
  get 'dashboard/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'welcome#index'
  devise_for :users
  resources :profiles, only:[:edit, :update, :show]
  resources :beneficiaries, only:[:edit, :update, :show]
  resources :accounts, only:[:show]
  resources :addresses, only:[:edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
