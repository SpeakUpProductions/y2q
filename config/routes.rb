Y2q::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  get "videos/filtered", as: 'filtered_videos'
  resources :videos, only: [:index, :new, :create]
  resource :profile, only: ['edit', 'show', 'update']

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'welcome#index'
end
