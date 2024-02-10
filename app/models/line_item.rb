class LineItem < ApplicationRecord
  belongs_to :timesheet
  
  validates :date, presence: true
  validates :minutes, numericality: { greater_than: 0 }
end
