class FixForeignKeyInLineItems < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :line_items, :timesheets
    rename_column :line_items, :timesheet_id, :time_sheet_id
    add_foreign_key :line_items, :time_sheets, column: :time_sheet_id
  end
end
