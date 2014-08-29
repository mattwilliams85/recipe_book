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
      @tags = params[:tag].split('#')
      @tags.shift
      @tags.each do |tag|
        tag = tag.downcase.chomp
      if Tag.find_by(name: tag) == nil
        @tag = Tag.create(:name => tag)
      else
        @tag = Tag.find_by(name: tag)
      end
      @recipe.tags << @tag
    end
      flash[:notice] = "Recipe added."
      redirect_to("/")
    else
      render('recipes/new.html.erb')
    end
  end

  def destroy
     @recipe = Recipe.find(params[:id])
     @recipe.tags.destroy_all
    if @recipe.destroy
      flash[:notice] = "Recipe deleted."
      redirect_to("/recipes/library")
    else
      render('recipes/show.html.erb')
    end
  end

  def library
    if params[:query]
      @recipes = []
      @recipes << Recipe.basic_search(params[:query])
      @recipes << Tag.basic_search(params[:query])
      @recipes = @recipes.flatten.uniq
      render('recipes/results.html.erb')
    else
      @recipes = Recipe.all
      @tags = Tag.all
      render('recipes/lib.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @tags = []
    @recipe = Recipe.find(params[:id])
    @recipe.tags.each do |tag|
      @tags << "##{tag.name}"
    end
    @tags = @tags.join
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(:name => params[:name],
                      :content => params[:content],
                      :ingredients => params[:ingredients],
                      :rating => params[:rating])
    @recipe.tags.each { |tag| tag.destroy }
    @recipe.tags.destroy_all
    @tags = params[:tag].split('#')
    @tags.shift
    @tags.each do |tag|
      tag = tag.downcase.chomp
      if Tag.find_by(name: tag) == nil
        @tag = Tag.create(:name => tag)
      else
        @tag = Tag.find_by(name: tag)
      end
      @recipe.tags << @tag
    end
      flash[:notice] = "Your recipe was revised."
      redirect_to("/recipes/#{@recipe.id}/show")
    else
      render('recipes/edit.html.erb')
    end
  end

end
