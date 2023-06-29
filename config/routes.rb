Rails.application.routes.draw do
  root "dashboards#index"
  resources :products
  
  

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords'
  # Agrega aquí otros controladores de Devise según tus necesidades
}
  scope module: :api do
    resources :menus
    resources :categories
  end
  
end
