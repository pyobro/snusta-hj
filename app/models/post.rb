class Post < ApplicationRecord
  mount_uploader :img_path, ImgUploader

  belongs_to :user
  has_many :likes
  def has_like(user)
    self.likes.where(user_id: user.id).count != 0
  end

  has_many :comments

end
