class RecipesController < ApplicationController
  get '/' do
    Recipe.all(:order => [ :id.desc ]).to_json
  end

  get '/:id' do
    recipe = Recipe.get(params['id'])
    if recipe
      recipe.to_json
    else
      halt not_found
    end
  end

  not_found do
    {:result => 'error', :message => 'not_found'}.to_json
  end
end
