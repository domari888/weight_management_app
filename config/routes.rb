Rails.application.routes.draw do
  root 'graphs#index'
  devise_for :users
  resource :graphs, only: %i[index create update]
end
