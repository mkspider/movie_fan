Rails.application.routes.draw do
devise_for :admins, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}



  namespace :user do

    resources :reviews, only:[:new,:index,:show,:create,:edit,:update,:destroy]
    resources :comments, only:[:new,:index,:show,:create,:edit,:update,:destroy]
    resources :genres, only:[:show]
    resources :movies, only:[:index,:show]

  end
  namespace :admin do
    resources :reviews, only:[:index,:show,:destroy]
    resources :comments, only:[:index,:show,:destroy]
    resources :movies, only:[:new,:index,:show,:create,:edit,:update,:destroy]
    resources :genres, only:[:index,:create,:edit,:update]
  end

  root to: "homes#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
