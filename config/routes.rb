Rails.application.routes.draw do
  resources :news, :except => [:update, :destroy]

  devise_for :users,
             controllers: {
              sessions: 'users/sessions',
              registrations: 'users/registrations'
             }
  post '/authentication_tokens', to: "authentication_tokens#create"
  get '/member-data', to: 'members#show'
  
  resources :users, :except => [:create, :destroy] do
    get '/news', to: 'news#show_user_news'
  end
  post 'auth/request', to:'authorization#get_authorization'
end
