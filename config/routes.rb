Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "beaches#index"
  resources :beaches do
    resources :reviews, only: [:index, :new, :create]
    get "traffic", to: "traffics#index"
    get "weather", to: "weathers#index"
    get "real_time", to: "real_times#index"
  end
end
