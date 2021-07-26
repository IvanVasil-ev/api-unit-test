Rails.application.routes.draw do
  resources :news
  resources :users, :except => [:create, :destroy]

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  post '/authentication_tokens', to: "authentication_tokens#create"
  get '/member-data', to: 'members#show'

  get '/users', to: 'users/sessions#index'
  get 'users/:id/news' => 'news#show_user_news', :as => :user_posts
end
