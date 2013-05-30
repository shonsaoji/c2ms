class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string  :name
      t.integer :age
      t.string  :title
      t.integer :experience
      t.integer :department_id
      t.timestamps
	end
  end

  def down
  	drop_table :employees
  end
end
