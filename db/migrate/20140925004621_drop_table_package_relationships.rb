class DropTablePackageRelationships < ActiveRecord::Migration
  def change
  	drop_table :package_relationships
  end
end
