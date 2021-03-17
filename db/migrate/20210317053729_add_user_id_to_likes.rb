class AddUserIdToLikes < ActiveRecord::Migration[6.0]
  def change
    change_table :likes do |t|
      t.references :likes, :user, foreign_key: true
    end
  end
end
