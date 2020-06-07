class AddIsSetAsExampleAndPostExampleIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_example_id, :integer
    add_column :posts, :is_set_as_example, :boolean, default: false
  end
end
