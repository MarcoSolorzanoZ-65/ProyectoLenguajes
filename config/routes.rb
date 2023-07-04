Rails.application.routes.draw do
  root "dashboards#index"
  resources :products

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
    # Agrega aquí otros controladores de Devise según tus necesidades
  }

  resources :users  # Agrega esta línea para definir la ruta de los usuarios

  scope module: :api do
    resources :menus
    resources :categories
  end
end

