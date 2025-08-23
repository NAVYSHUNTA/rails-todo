Rails.application.routes.draw do
  root "todos#index"
  resources :todos

  resource :setting, only: [:edit, :update]
end
