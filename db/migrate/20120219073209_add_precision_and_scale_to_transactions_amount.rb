class AddPrecisionAndScaleToTransactionsAmount < ActiveRecord::Migration
  def change
    change_column :transactions, :amount, :decimal, :precision => 14,
      :scale => 2
  end
end
