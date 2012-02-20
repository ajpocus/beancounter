class AddUserIdToStatementEntries < ActiveRecord::Migration
  def change
    add_column :statement_entries, :user_id, :integer
  end
end
