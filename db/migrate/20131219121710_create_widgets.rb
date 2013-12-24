class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :title
      t.integer :quantity
      t.decimal :price
      t.boolean :sellable

      t.timestamps
    end
  end
end
