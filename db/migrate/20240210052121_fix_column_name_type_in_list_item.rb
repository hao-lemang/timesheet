class FixColumnNameTypeInListItem < ActiveRecord::Migration[7.1]
  def change
    rename_column :line_items, :mintes, :minutes
  end
end
