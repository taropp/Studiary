class Learning < ApplicationRecord
  belongs_to :user
  validates :user_id,       presence: true
  validates :content,       presence: true, length: { maximum: 300 }
  validates :learning_time, presence: true
end
