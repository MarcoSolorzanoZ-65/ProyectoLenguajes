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
  

  resources :users  # Agrega esta línea para definir la ruta de los usuarios

  scope module: :api do
    resources :menus
    resources :categories
    resources :orders
  end
end

