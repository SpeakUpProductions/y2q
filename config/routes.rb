Y2q::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  put "welcome/played"
  get "videos/filtered", as: 'filtered_videos'
  get "instructions", as: :instructions, to: 'instructions#show'
  resources :videos
  resources :developers
  resource :profile, only: ['edit', 'show', 'update'], as: 'current_profile' do
    get "videos", to: "videos#current_user_index", as: "current_user_videos"
  end
  resources :profiles, only: [:show]

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'welcome#index'
end
