Rails.application.routes.draw do
  root "dashboards#index"
  resources :products

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users

  scope module: :api do
    resources :menus
    resources :categories
    resources :orders
    put '/users/:id', to: 'users#update'  # Agrega esta línea para la ruta de actualización del usuario
  end

  post '/login', to: 'users/sessions#create'
end
