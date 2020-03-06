class ReviewPolicy < ApplicationPolicy
  def create?
    record.user == user
  end

  def new?
    record.booking.user == user
  end
end
