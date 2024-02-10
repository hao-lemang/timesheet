class LineItem < ApplicationRecord
  belongs_to :time_sheet
  
  validates :date, presence: true
  validates :minutes, numericality: { greater_than: 0 }
end
