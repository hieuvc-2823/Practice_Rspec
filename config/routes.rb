Rails.application.routes.draw do
  root "users#index"

  get "/login", to: "users#index"
  get "products/show"

  resources :users do
    resources :micropost, only: :show
  end
end
