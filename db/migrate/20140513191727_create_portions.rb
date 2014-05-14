class CreatePortions < ActiveRecord::Migration
  def change
    # this is our JOIN TABLE
    create_table :portions do |t|

      # our two foreign keys
      t.integer   :recipe_id
      t.integer   :ingredient_id

      t.integer   :quantity

    end
  end
end
