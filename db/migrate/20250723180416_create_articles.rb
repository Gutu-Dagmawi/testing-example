class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
