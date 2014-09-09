class AddRefNumberColumnToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :ref_number, :string
  end
end
