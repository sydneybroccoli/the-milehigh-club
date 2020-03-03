class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :booking_type
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :seen
      t.boolean :confirm
      t.float :price
      t.references :user, foreign_key: true
      t.references :aircraft, foreign_key: true

      t.timestamps
    end
  end
end
