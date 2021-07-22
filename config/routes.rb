Rails.application.routes.draw do
  resources :news
  resources :users

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  post '/authentication_tokens', to: "authentication_tokens#create"
  get '/member-data', to: 'members#show'

  get '/users', to: 'users/sessions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
