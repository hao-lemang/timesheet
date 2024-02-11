class TimeSheet < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank

  validates :rate, presence: true

  def total_time
   line_items.sum(:minutes)
  end

  def total_cost
    (total_time * rate) / 60.0
  end
  
  def date_range
    if line_items.count == 1
      return line_items.last.date
    else
      min_date = line_items.minimum(:date)
      max_date = line_items.maximum(:date)
      return min_date..max_date
    end
  end
end
