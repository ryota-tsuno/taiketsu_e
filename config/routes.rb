Rails.application.routes.draw do
  root "topics#index"
  resources :topics
  resources :abouts, only: [:index]
end