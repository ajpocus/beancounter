class AddPrecisionAndScaleToAccountsBalance < ActiveRecord::Migration
  def change
    change_column :accounts, :balance, :decimal, :precision => 14, :scale => 2
  end
end
