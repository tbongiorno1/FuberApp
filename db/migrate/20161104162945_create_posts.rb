class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.references :course, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
