Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
  end

  get '/weather/' => 'weather#show'
  get '/news/' => 'news#show'
  get '/restaurants/' => 'restaurants#show'
  get '/movies/' => 'movies#show'
  get '/drinks/' => 'drinks#show'


  post '/session' => 'session#create'

  post '/user/:id/movies/' => 'movies#favorites'

  post '/user/:id/restaurants/' => 'restaurants#favorites'

  post '/user/:id/drinks/' => 'drinks#favorites'

  post '/user/:id/news_items/' => 'movies#favorites'


  get '/session' => 'session#index'

end
