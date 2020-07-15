Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events do
    member do
      put "toggle_active", to: "events#toggle_active"
    end
  end

  root to: "home#home"
end
