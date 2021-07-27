class AddNewsId < ActiveRecord::Migration[6.1]
  def change
    add_reference :news, :user_id, index: true
  end
end
