class Ingredient
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, format: /[a-zA-Z0-9 ]+/, unique: true
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :recipe_ingredients
  has n, :recipes, through: :recipe_ingredients
end
