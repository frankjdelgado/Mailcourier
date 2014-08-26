class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
			t.text :description
			t.float :weight, null: false
			t.float :height, null: false
			t.float :depth, null: false
			t.float :value, null: false
			t.integer :status, default: 0
			t.datetime :date_added, null: false
			t.datetime :date_arrived
			t.datetime :date_delivered
    end
  end
end
