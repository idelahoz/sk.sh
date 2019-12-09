Rails.application.routes.draw do
  root to: 'urls#index'
  get "/:token", to: "urls#show", as: :click
  post "/", to: "urls#create"

  resources :urls, only: [] do
    resources :clicks, only: :index
  end
end
