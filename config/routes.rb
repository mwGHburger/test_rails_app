Rails.application.routes.draw do
  resources :dogs
  get 'about/index'
  resources :users, :path => '/'
end
