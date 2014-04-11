Y2q::Application.routes.draw do
  get "about/index"
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'welcome#index'
end
