Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :beaches do
    resources :reviews, only: [:index, :new, :create]
    get "traffic", to: "beaches#traffic"
    get "weather", to: "beaches#weather"
    get "real_time", to: "beaches#real_time"
  end
end
