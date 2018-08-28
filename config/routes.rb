Rails.application.routes.draw do
  get 'users/index'
  get 'dashboard' => 'dashboard#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'welcome#index'
  devise_for :users
  resources :profiles, only:[:edit, :update, :show]
  resources :beneficiaries, only:[:edit, :update, :show]
  get '/account' => 'accounts#show', as: :account
  resources :addresses, only:[:edit, :update, :index]
  resources :transactions, only: [:index, :show, :new, :create] do
  	collection do
  		get :enquiry
  	end
  end
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
