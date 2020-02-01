class User < ApplicationRecord
  #:lockable, :timeoutable, :trackable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        name:  auth.info.name,
        password: Devise.friendly_token[0, 20],
        image:  auth.info.image
      )
    end
    user
  end
end