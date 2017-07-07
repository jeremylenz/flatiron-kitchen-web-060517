class RecipesController < ApplicationController


    def new
      @recipe = Recipe.new
    end

    def edit
      @recipe = Recipe.find(params[:id])
    end

    def index
    end

    def create
      @recipe = Recipe.create(recipe_params(:name))
      ingredients = params[:recipe][:ingredient_ids]
      ingredients.reject! { |elem| elem.empty? }
      @recipe.ingredients = ingredients.map { |i| Ingredient.find(i.to_i) }
      redirect_to @recipe
    end

    def show
      @recipe = Recipe.find(params[:id])
    end

    def update
      @recipe = Recipe.find(params[:id])
      @recipe.update(recipe_params(:name))
      ingredients = params[:recipe][:ingredient_ids]
      ingredients.reject! { |elem| elem.empty? }
      @recipe.ingredients = ingredients.map { |i| Ingredient.find(i.to_i) }
      redirect_to @recipe
    end


  private

    def recipe_params(*args)
      params.require(:recipe).permit(*args)
    end




end
