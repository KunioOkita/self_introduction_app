Rails.application.routes.draw do
  resources :users, only: %i[index show destroy]
  resources :projects
  resources :skills
  resources :skill_categories
  resources :divisions
  resources :departments
  resources :user_self_introductions, only: %i[new create show edit update]

  resources :user_divisions, only: %i[update destory]
  resources :user_skills, only: %i[update destory]

  root "top#index"
  get "auth/signout"
  get "master_data/index"
  # Add route for OmniAuth callback
  match "/auth/:provider/callback", to: "auth#callback", via: [:get, :post]
end
