class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }

  belongs_to :user

  mount_uploader :image, ImageUploader
end
