Y2q::Application.routes.draw do
  get "about/index"
  resources :videos, only: [:index, :new]
  resource :profile, only: ['show']
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'welcome#index'
end
