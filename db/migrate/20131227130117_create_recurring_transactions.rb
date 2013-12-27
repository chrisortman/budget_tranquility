class CreateRecurringTransactions < ActiveRecord::Migration
  def change
    create_table :recurring_transactions do |t|
      t.string :description
      t.decimal :amount
      t.string :schedule_type
      t.string :schedule_json

      t.timestamps
    end
  end
end
