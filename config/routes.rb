Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resource :accounts
  get 'activity/mine'
  get 'activity/feed'

  root 'activity#mine'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

