class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :department
      t.integer :salary

      t.timestamps
    end
  end
end
