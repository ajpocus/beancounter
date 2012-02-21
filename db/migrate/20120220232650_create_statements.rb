class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :file

      t.timestamps
    end
  end
end
