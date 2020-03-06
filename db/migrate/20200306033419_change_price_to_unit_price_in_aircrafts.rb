class ChangePriceToUnitPriceInAircrafts < ActiveRecord::Migration[5.2]
  def change
    rename_column :aircrafts, :price, :unit_price
  end
end
