class CreateTables < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :varchar
      t.column :content, :varchar
      t.column :rating, :int
      t.column :date, :date

      t.timestamps
    end

    create_table :tags do |t|
      t.column :name, :varchar
    end

    create_table :recipes_tags do |t|
      t.column :recipe_id, :int
      t.column :tag_id, :int
    end
  end
end
