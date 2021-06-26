Rails.application.routes.draw do
  root 'graphs#index'
  devise_for :users
end
