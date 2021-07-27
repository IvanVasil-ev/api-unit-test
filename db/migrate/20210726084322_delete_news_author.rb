class DeleteNewsAuthor < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :author
  end
end
