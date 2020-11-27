Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root "events#top"
  resources :events
  get "/search" => "searches#search"
end
