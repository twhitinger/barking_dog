Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/search', to: "search#index"
  get "/search/:id", to: "search#show"
  get "/search/more_search_results/:query", to: "search#more_search_results"
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
