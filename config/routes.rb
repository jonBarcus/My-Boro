Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
    resources :favorites
  end

  get '/weather/' => 'weather#show'
  get '/news/' => 'news#show'
  get '/restaurants/' => 'restaurants#show'
  get '/movies/' => 'movies#show'


end
