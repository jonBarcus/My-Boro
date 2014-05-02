Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
  end

  get '/weather/' => 'weather#show'
  get '/news/' => 'news#show'
  get '/restaurants/' => 'restaurants#show'
  get '/movies/' => 'movies#show'
  get '/drinks/' => 'drinks#show'
  get '/mta/' => 'mta#show'


  post '/session' => 'session#create'

  post '/favorite_movies/' => 'movies#favorites'

  post '/favorite_restaurants/' => 'restaurants#favorites'

  post '/favorite_drinks/' => 'drinks#favorites'

  post '/favorite_news_items/' => 'news#favorites'


  get '/session' => 'session#index'

end
