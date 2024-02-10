class TimeSheet < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items, allow_destroy: true

  def total_time
   line_items.sum(:minutes)
  end

  def total_cost
    total_time * rate
  end
end
