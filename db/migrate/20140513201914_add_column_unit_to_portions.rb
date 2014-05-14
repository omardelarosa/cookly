class AddColumnUnitToPortions < ActiveRecord::Migration
  def change
    add_column :portions, :unit, :string
  end
end
