class DeleteUserAvatarColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :picture
  end
end
