class Cookbook < ActiveRecord::Base
  # gives all cookbook instances a .recipes method
  has_many :recipes
  # note: you must also have a 'recipes' table
  # and it must have a column called 'cookbook_id'

  belongs_to :chef


  # # hand-rolled version of 'has_many :recipes'
  # def recipes
  #   # make some SQL query
  #   Recipe.where("cookbook_id=#{self.id}")
  # end

end
