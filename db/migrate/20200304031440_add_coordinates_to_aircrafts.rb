class AddCoordinatesToAircrafts < ActiveRecord::Migration[5.2]
  def change
    add_column :aircrafts, :latitude, :float
    add_column :aircrafts, :longitude, :float
  end
end
