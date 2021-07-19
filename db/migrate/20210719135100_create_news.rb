class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string "title"
      t.string "description"
      t.string "picture"
      t.string "tags"
      t.string "author"

      t.timestamps
    end
  end
end
