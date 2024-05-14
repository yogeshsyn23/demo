Rails.application.routes.draw do
  get 'analysis/index'
  get 'analysis/show'
  get 'welcome/index'
  get '/welcome/send_mail' , to: "welcome#send_mail"
  devise_for :users
  get '/home',to: "home#index"
  root 'home#index'
  get '/home/download',to: "home#download"
  post '/home/import',to: "home#import"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
