class AddStatusToRecord < ActiveRecord::Migration[5.0]
  def change
  	add_column :records, :status, :string, :default => "draft"
  	add_column :records, :to_finance, :integer, :default => 0
  end
end
