Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :captions, only: [:index, :show, :create, :destroy]
end