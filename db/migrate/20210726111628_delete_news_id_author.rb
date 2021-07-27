class DeleteNewsIdAuthor < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :user_id
    remove_column :news, :author_name
  end
end
