class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.integer :capacity
    	t.string :address
    	t.string :phone_number
    	t.string :picture
    	t.text :description
    	t.string :category
      t.timestamps
    end
  end
end
