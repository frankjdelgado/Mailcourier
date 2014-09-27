class AddIndexStatusToRates < ActiveRecord::Migration
  def change
  	add_index :rates, :status
  end
end
