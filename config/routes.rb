Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  # end
  resources :user, only: [] do
    get 'dashboard'
  end
  root to: "users#dashboard"
end
