class AddPostModelIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_model_id, :integer
  end
end
