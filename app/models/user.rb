class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }, presence: true, on: :create
    validates :password, length: { minimum: 6 }, allow_nil: true, on: :update
    validates :location, length: { maximum: 20 }
    validates :location, presence: true,  on: :update
end
