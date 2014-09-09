class AddShippingCostColumnToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :shipping_cost, :float
  end
end
