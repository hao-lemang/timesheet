class User < ApplicationRecord
  has_many :timesheets, dependent: :destroy
end
