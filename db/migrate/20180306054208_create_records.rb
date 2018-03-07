class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
    	t.string :purpose
    	t.string :description
    	t.string :start_date
    	t.string :end_date
    	t.string :mode
    	t.integer :cost
    	t.integer :home_city_price
    	t.integer :destination_city_price
    	t.integer :hotel_price
    	t.string :local_transport

    	t.references :user, foreign_key: true
    	t.integer :manager_id

      	t.timestamps
    end
  end
end
