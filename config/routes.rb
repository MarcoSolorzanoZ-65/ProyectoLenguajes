Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root "products#index"

  resources :products
  
  scope module: :api do
    resources :menus
  end
  
end
