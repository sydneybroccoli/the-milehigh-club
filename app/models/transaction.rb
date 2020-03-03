class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :aircraft
  has_one :review

  validates :transaction_type, presence: true, inclusion: { in: ['sale', 'rental'] }
  # validates_uniqueness_of :type, scope: ['sale', 'rental']
  validates :final_price, presence: true
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end

end
