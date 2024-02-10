class CreateTimeSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :time_sheets do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.decimal :rate, precision: 10, scale: 2

      t.timestamps
    end
  end
end
