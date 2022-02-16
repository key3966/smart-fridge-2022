Rails.application.routes.draw do
  
  devise_for :users
  root to: "fridges#index"
  resources :fridges, only: [:index, :create, :update] do
    resources :shoppings, only: :index
  end
  resources :items, only: [:create, :update, :destroy]
end
