class CreateSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :spendings do |t|
      t.string :category, null: false
      t.date :year_month,null: false
      t.integer :value,null: false
      t.references :user               ,foreign_key: true
      t.timestamps
    end
  end
end
