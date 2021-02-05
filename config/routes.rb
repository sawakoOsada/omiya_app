Rails.application.routes.draw do
  root 'top#index'

  devise_for :users

  resources :souvenirs, only: [:index, :show] do
    resources :reviews
  end

  resources :carts, only: [:show] do
    member do
      post :pay
    end
  end

  resources :cart_items, only: [:create, :update, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
