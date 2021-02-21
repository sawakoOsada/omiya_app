Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
end

  resources :souvenirs, only: [:index, :show] do
    resources :reviews
  end

  resources :carts, only: [:show] do
    member do
      post :pay
    end
    collection do
      post :confirm
    end
  end

  resources :cart_items, only: [:create, :update, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
