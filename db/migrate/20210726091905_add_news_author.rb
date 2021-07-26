class AddNewsAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :author_name, :string
  end
end
