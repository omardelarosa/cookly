class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      # int(id) gets made automatically
      t.string    :name
      t.text      :bio
    end
  end
end
