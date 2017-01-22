class RecipeIngredient
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime

  belongs_to :recipe
  belongs_to :ingredient
end
