Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
    resources :favorites
  end

  get '/welcome' => 'welcome#get_weather'

end
