class Transaction < ApplicationRecord
  belongs_to :user_id
  belongs_to :aircraft_id
end
