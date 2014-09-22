class CreatePackageRelationships < ActiveRecord::Migration
  def change
    create_table :package_relationships do |t|
      t.references :user, index: true
	  t.references :package, index: true
	  t.boolean :sender
    end
  end
end
