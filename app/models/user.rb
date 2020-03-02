class User < ApplicationRecord
  has_many :aircrafts, dependent: :destroy
  has_many :transactions
  has_many :reviews

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
