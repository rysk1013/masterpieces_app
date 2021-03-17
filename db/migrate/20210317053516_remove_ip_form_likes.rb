class RemoveIpFormLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :ip, :string
  end
end
