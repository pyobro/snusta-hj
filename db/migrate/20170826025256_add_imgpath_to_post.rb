class AddImgpathToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :img_path, :text, after: :content
  end
end
