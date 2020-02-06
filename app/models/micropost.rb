class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }, uniqueness: {scope: :user_id}
  validate :picture_size
  
  def user
    User.find_by(id: user_id)
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MB以下にして下さい")
    end
  end
end
