Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'recipes#index'})
  match('recipes', {:via => :get, :to => 'recipes#new'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
  match('recipes', {:via => :delete, :to => 'recipes#destroy'})
end
