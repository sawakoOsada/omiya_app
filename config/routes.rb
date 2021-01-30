Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :souvenirs, only: [:index, :show] do
    resources :reviews
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
