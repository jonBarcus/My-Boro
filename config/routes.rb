Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
    resources :favorites
  end

  get '/weather/' => 'weather#show'


end
