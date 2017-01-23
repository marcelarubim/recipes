class IngredientsController < ApplicationController
  get '/' do
    Ingredient.all(:order => [ :id.desc ]).to_json
  end

  get '/:id' do
    ingredient = Ingredient.get(params['id'])
    if ingredient
      ingredient.to_json
    else
      halt not_found
    end
  end

  get '/:id/recipes' do
    ingredient = Ingredient.get(params['id'])
    if not ingredient
      halt not_found
    end
    ingredient.recipes.to_json
  end
end
