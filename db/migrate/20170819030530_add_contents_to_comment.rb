class AddContentsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :contents, :string
  end
end
