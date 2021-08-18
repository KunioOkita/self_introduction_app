Rails.application.routes.draw do
  resources :skill_categories
  resources :divisions
  resources :departments
  resources :user_self_introductions, only: %i[new create show edit update]

  root 'top#index'
  get 'auth/signout'
  get 'master_data/index'
  # Add route for OmniAuth callback
  match '/auth/:provider/callback', :to => 'auth#callback', :via => [:get, :post]
end
