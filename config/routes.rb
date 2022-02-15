Rails.application.routes.draw do
  
  devise_for :users
  root to: "fridges#index"
  resources :fridges, only: [:index, :create] do
    resources :shoppings, only: :index
  end
end
