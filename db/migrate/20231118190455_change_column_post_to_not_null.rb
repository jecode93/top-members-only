class ChangeColumnPostToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :body, :text
  end
end
