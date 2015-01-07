class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :comment            
      t.timestamps null: false
    end
  end
end
