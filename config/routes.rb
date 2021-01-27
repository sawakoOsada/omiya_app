Rails.application.routes.draw do
  root 'top#index'
  resources :souvenirs, only: [:index, :show]
end
