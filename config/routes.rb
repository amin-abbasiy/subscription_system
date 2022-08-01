Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }
  namespace :api do
    namespace :v1 do
      get 'google/login', to: "googles#login"
      match 'google/callback', to: "googles#callback", via: [:get, :post]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
