class AddProgrammingLanguagesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :programming_languages, :text, null: false
  end
end
