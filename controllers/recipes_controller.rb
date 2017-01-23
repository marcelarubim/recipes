class RecipesController < ApplicationController
  get '/' do
    Recipe.all(:order => [ :id.desc ]).to_json
  end

  get '/search' do
    halt 400 if params[:ingredients].nil?
    ids = params[:ingredients].split(",").map(&:to_i)
    Recipe.all(Recipe.ingredients.id => ids).to_json
  end

  get '/:id' do
    recipe = Recipe.get(params['id'])
    if recipe
      recipe.to_json
    else
      halt not_found
    end
  end

  get '/:id/ingredients' do
    recipe = Recipe.get(params['id'])
    if not recipe
      halt not_found
    end
    recipe.ingredients.to_json
  end
end
