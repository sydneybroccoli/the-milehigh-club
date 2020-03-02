class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :transaction_id
end
