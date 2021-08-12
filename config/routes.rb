Rails.application.routes.draw do
  root 'top#index'
  get 'auth/signout'
  # Add route for OmniAuth callback
  match '/auth/:provider/callback', :to => 'auth#callback', :via => [:get, :post]
end
