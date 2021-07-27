class AddAvatarToNews < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :picture, :string
  end
end
