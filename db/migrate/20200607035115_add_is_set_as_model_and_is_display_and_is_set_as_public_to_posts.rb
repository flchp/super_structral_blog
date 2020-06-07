class AddIsSetAsModelAndIsDisplayAndIsSetAsPublicToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :is_set_as_model, :boolean, default: false
    add_column :posts, :is_set_as_public, :boolean, default: false
    add_column :posts, :is_display, :boolean, default: true
  end
end
