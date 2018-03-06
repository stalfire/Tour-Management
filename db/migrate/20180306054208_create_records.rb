class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
    	t.string :purpose
    	t.string :description
    	t.string :start_date
    	t.string :end_date
    	t.string :mode
    	t.float :cost
    	t.float :home_city_price
    	t.float :destination_city_price
    	t.float :hotel_price
    	t.string :local_transport

    	t.references :user, foreign_key: true
    	t.integer :manager_id

      	t.timestamps
    end
  end
end
