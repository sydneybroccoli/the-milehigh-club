class Aircraft < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model,
    against: [ :make, :model ],
    using: {
      tsearch: { prefix: true }
  }

  validates :photos, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :location, presence: true
  validates :unit_price, presence: true
  validates :capacity, presence: true
  validates :hours, presence: true
  validates :year, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
