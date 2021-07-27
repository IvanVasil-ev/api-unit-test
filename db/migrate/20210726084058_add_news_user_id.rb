class AddNewsUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :user_id, :numeric
  end
end
