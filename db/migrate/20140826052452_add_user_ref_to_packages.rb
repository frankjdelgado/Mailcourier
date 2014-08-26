class AddUserRefToPackages < ActiveRecord::Migration
  def change
		add_column  :packages, :destiny, :integer
		add_column  :packages, :sender, :integer
		add_column	:packages, :receiver, :integer
		add_index	:packages, :destiny
		add_index	:packages, :sender
		add_index	:packages, :receiver
  end
end
