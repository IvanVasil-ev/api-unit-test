Rails.application.routes.draw do
  resources :news, :except => [:update, :destroy]
  resources :users, :except => [:create, :destroy] do
    get '/news', to: 'news#show_user_news'
  end

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  post '/authentication_tokens', to: "authentication_tokens#create"
  get '/member-data', to: 'members#show'
end
