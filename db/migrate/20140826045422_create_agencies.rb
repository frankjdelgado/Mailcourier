class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
    	t.text :ubication, null: false
    end
  end
end
