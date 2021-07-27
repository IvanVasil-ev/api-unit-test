class DeleteRef < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :user_id_id
  end
end