class RemoveLikeIdFromLike < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :likes_id
  end
end
