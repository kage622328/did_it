Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords' # パスワードコントローラーを追加
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  root "static_pages#top"

  resources :users, only: %i[show] do
    get 'menu', on: :member
  end

  resources :children do
    resources :lists, shallow: true
    resources :completed_tasks, only: %i[index]
    member do
      patch 'update_list_and_coin'
    end
  end

  resources :tasks do
    member do
      patch :change_status
    end
  end
  
end
