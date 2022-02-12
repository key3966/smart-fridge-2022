Rails.application.routes.draw do
  
  root to: "fridges#index"
  resources :fridges, only: :index do
    resources :shoppings, only: :index
  end
end
