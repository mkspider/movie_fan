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
get "homes/search_movie" => "homes#search"


  namespace :users do
    resources :users, only:[:show,:edit,:update]
    resources :genres, only:[:show]
    resources :movies, only:[:index,:show] do
      resources :reviews do
         resources :comments do
         end
      end
    end



  end

  namespace :admins do
    resources :users, only:[:index,:show,:destroy]
    resources :movies do
      resources :reviews, only:[:create,:index,:show,:destroy]do
        resources :comments, only:[:index,:show,:destroy]do
        end
      end
    end
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
  end
  # resources :movies do
  #   resources :reviews,module: 'users'
  # end
  # resources :reviews do
  #   resources :comments,module: 'users'
  # end
  root to: "homes#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
