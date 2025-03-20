class CreateCategoryWatchers < ActiveRecord::Migration[6.0]
  def change
    create_table :category_watchers do |t|
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
