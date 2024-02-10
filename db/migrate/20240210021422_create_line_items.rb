class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.references :timesheet, null: false, foreign_key: true
      t.date :date
      t.integer :mintes

      t.timestamps
    end
  end
end
