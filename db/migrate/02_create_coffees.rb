class CreateCoffees < ActiveRecord::Migration

  def change
    create_table :coffee do |t|
      t.string :flavor
      t.string :price
      t.string :user_id 
    end 
  end 
end 