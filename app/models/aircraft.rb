  class Aircraft < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photo

  validates :make, presence: true
  validates :model, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :hours, presence: true
  validates :year, presence: true
  validates :description, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
