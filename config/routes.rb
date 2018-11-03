Rails.application.routes.draw do
  root "taiketsus#index"
  resources :taiketsus, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  resources :abouts, only: [:index]
end
