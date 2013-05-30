class CreateBusinessUnits < ActiveRecord::Migration
  def up
    create_table :business_units do |t|
      t.string :name

      t.timestamps
	end
  end

  def down
  	drop_table :business_units
  end
end
