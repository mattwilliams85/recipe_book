Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'recipes#index'})
end
