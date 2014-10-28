Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :index]

  get 'cart' => 'orders#cart'
  post 'cart' => 'orders#create'
  post 'cart/add' => 'orders#add_to_cart'
  post 'cart/inc' => 'orders#inc'
  post 'cart/dec' => 'orders#dec'
  delete 'cart' => 'orders#del'
end
