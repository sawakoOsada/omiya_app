Rails.application.routes.draw do
  resources :souvenirs, only: [:index, :show]
end
