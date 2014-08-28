class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @recipe = @recipes.all.shuffle[0]
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipes = Recipe.all
    @recipe = Recipe.new(params[:recipe])
     if @recipe.save
      flash[:notice] = "Recipe added."
      redirect_to("/")
    else
      render('recipes/new.html.erb')
    end
  end

end
