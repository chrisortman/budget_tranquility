class CreateEnvelopes < ActiveRecord::Migration
  def change
    create_table :envelopes do |t|
      t.string :label
      t.decimal :per_month
      t.decimal :per_check

      t.timestamps
    end
  end
end
