# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Dogs controller
  resources :dogs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
    member do
      get 'calculate_total_price'
    end
  end
  resources :bookings do
    member do
      patch :accept
      patch :decline
    end
  end
end
