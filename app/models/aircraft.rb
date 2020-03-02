  class Aircraft < ApplicationRecord
  belongs_to :user

  validates :make, presence: true
  validates :model, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :hours, presence: true
  validates :year, presence: true
  validates :description, presence: true
end
