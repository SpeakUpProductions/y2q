Y2q::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  get "videos/filtered", as: 'filtered_videos'
  resources :videos, only: [:show, :index, :new, :create, :update, :edit]
  resource :profile, only: ['edit', 'show', 'update'] do
    get "videos", to: "videos#current_user_index", as: "current_user_videos"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'welcome#index'
end
