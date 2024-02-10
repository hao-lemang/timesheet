class User < ApplicationRecord
  has_many :time_sheets, dependent: :destroy
end
