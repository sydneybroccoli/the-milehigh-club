class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :aircraft
  has_many :reviews

  validates :transaction_type, presence: true, inclusion: { in: ['sale', 'rental'] }
  # validates_uniqueness_of :type, scope: ['sale', 'rental']
  validates :final_price, presence: true
end
