class ChangeNewsAuthor < ActiveRecord::Migration[6.1]
  def change
    change_column :news, :user_id, :integer
  end
end
