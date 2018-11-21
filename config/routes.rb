Rails.application.routes.draw do
resources :users
resources :booklets
resources :pages
resources :images
resources :text_items
resources :lists
resources :list_items
post 'login', to 'users#log_in'
get 'validate', to 'users#validate'
end
