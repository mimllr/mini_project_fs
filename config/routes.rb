Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#home'
  get '/exchange' => 'main#get_exchange_rate'
  get '/about' => 'main#about'
end
