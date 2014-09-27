class AddStatusColumnToRates < ActiveRecord::Migration
  def change
    add_column :rates, :status, :integer, :default => 0
  end
end
