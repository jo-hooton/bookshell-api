Rails.application.routes.draw do
    resources :users
    resources :booklets
    resources :pages
    resources :images
    resources :text_items
    resources :lists
    resources :list_items
    resources :profiles
    patch 'publish_booklet', to: 'booklets#publish_booklet'
    post 'login', to: 'users#log_in'
    get 'validate', to: 'users#validate'
    get 'user_booklets', to: 'users#get_booklets'
end