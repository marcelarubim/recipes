class IngredientsController < ApplicationController
  get '/' do
    Ingredient.all(:order => [ :id.desc ]).to_json
  end
end
