class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :aircraft


  validates :type, presence: true
  validates_uniqueness_of :type, scope: ['sale', 'rental']
  validates :final_price, presence: true
end
