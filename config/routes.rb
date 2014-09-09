Rails.application.routes.draw do
  root :to => 'recipes#index'
  match('recipes', {:via => :get, :to => 'recipes#new'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
  match('recipes/:id', {:via => :delete, :to => 'recipes#destroy'})
  match('recipes/library', {:via => :get, :to => 'recipes#library'})
  match('recipes/:id/show', {:via => :get, :to => 'recipes#show'})
  match('recipes/:id/edit', {:via => :get, :to => 'recipes#edit'})
  match('recipes/:id', {:via => [:patch, :post], :to => 'recipes#update'})
  match('recipes/search', {:via => :get, :to => 'recipes#library'})
end
