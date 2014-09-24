class AddSrColumnsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :sender_id, :integer
    add_column :packages, :receiver_id, :integer
  end
end
