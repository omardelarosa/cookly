class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.string      :title
      t.text        :content

      # this must be called 'relation_id'
      t.integer     :cookbook_id

      t.timestamps
    end
  end
end
