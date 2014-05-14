class AddHashedPasswordAndEmailColumnsToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :email, :string
    add_column :chefs, :hashed_password, :string
  end
end
