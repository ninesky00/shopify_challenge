class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: true }
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true
end
