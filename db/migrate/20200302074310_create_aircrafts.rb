class CreateAircrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :aircrafts do |t|
      t.string :make
      t.string :model
      t.string :location
      t.integer :price
      t.integer :capacity
      t.integer :hours
      t.integer :year
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
