class RemoveUsetechFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :use_tech, :text
  end
end
