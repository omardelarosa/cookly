class Ingredient < ActiveRecord::Base
  # this allows me to say ingredient.recipes
  # connect it to ingredients THROUGH some join table
  has_many :recipes, through: :portions

  # this allows me to say recipe.portions
  has_many :portions
end
