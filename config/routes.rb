Rails.application.routes.draw do
  root :to => "bookers#index"
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books

  resources :users
  resources :bookers, only: [:index, :new]
end

