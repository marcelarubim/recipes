class Recipe
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, format: /[a-zA-Z0-9 ]+/, unique: true
  property :time, Integer, default: 0
  property :dificulty, Integer, max: 10, default: 0
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :recipe_ingredients
  has n, :ingredients, through: :recipe_ingredients
end
