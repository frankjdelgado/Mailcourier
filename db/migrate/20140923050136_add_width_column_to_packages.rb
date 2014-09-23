class AddWidthColumnToPackages < ActiveRecord::Migration
  def change
  	add_column :packages, :width, :float, null: false
  end
end
