class ChangeCoffeeTableName < ActiveRecord::Migration
  def change
    rename_table :coffee, :coffees
  end
end
