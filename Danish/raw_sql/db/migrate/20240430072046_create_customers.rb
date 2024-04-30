class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.date :date_of_birth
      t.string :gender
      t.string :occupation
      t.string :company
      t.text :interests
      t.integer :age
      t.integer :subscription_plan

      t.timestamps
    end
    add_index :customers, :username
    add_index :customers, :subscription_plan
  end
end
