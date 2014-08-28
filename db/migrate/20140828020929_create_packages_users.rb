class CreatePackagesUsers < ActiveRecord::Migration
  def change
    create_table :packages_users do |t|
    	t.references :user, index: true
		t.references :package, index: true
		t.boolean :sender
    end
  end
end
