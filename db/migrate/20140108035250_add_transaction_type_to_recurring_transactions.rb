class AddTransactionTypeToRecurringTransactions < ActiveRecord::Migration
  def change
    add_column :recurring_transactions, :transaction_type, :string, null: true
    add_column :recurring_transactions, :user_id, :integer, null: true
  end
end
