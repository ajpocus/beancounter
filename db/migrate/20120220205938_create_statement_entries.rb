class CreateStatementEntries < ActiveRecord::Migration
  def change
    create_table :statement_entries do |t|
      t.text :description
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
