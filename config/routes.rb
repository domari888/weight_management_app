Rails.application.routes.draw do
  root 'graphs#index'
  devise_for :users
  resourse :graphs, only: %i[index create update]
end
