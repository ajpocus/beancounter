class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.decimal :balance
      t.string :name

      t.timestamps
    end
  end
end
