class AddAccountIdToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :account_id, :integer
  end
end
