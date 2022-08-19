Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
post '/homes/guest_sign_in', to: 'homes#guest_sign_in'


  namespace :users do
    resources :comments
    resources :genres, only:[:show]
    resources :movies, only:[:index,:show]
    resources :users, only:[:show,:edit,:update]

  end
  namespace :admins do
    resources :reviews, only:[:create,:index,:show,:destroy]
    resources :comments, only:[:index,:show,:destroy]
    resources :movies
    resources :genres, only:[:index,:create,:edit,:update]
  end
  resources :movies do
    resources :reviews,module: 'users'
  end


  root to: "homes#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
