class DropTablePackagesUsers < ActiveRecord::Migration
  def change
  	drop_table :packages_users
  end
end
