Rails.application.routes.draw do
  root "dashboards#index"
  resources :products

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registratios: 'signup'
  },
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users # Ruta para acceder a los usuarios

  scope module: :api do
    resources :menus
    resources :categories
    resources :orders
  end

  post '/login', to: 'sessions#create' # Agrega esta línea para la ruta de inicio de sesión
end



