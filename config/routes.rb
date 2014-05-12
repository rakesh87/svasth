Rails.application.routes.draw do

  resources :users, only: [] do
    member do
      get 'dashboard'
      get 'feeds_count'
    end
  end

  resources :news_items, except: [:edit, :update] do
    resources :comments, only: [:create, :index]
  end


  devise_for :users

  root to: "users#dashboard"
end
