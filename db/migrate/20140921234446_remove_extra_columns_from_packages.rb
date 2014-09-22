class RemoveExtraColumnsFromPackages < ActiveRecord::Migration
  def change
    remove_column :packages, :destiny, :integer
    remove_column :packages, :sender, :integer
    remove_column :packages, :receiver, :integer
  end
end
