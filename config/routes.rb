Rails.application.routes.draw do
  root "taiketsus#index"
  resources :taiketsus, only: [:index, :show, :create] do
    resources :comments, only: [:index, :show, :create, :destroy]
  end
  resources :abouts, only: [:index]
end
