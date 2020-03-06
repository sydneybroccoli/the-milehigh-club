class BookingPolicy < ApplicationPolicy

  def show?
    record.user == user || record.aircraft.user == user
  end

  def create?
    return true
  end

  def update?
    record.user == user || record.aircraft.user == user
  end

  def destroy?
    record.user == user || record.aircraft.user == user
  end
end
