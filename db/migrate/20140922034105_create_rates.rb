class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.float :package
      t.float :cost
      t.timestamps
    end
  end
end
