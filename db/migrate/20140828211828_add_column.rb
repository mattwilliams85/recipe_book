class AddColumn < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :varchar
  end
end
