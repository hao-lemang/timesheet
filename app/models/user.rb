class User < ApplicationRecord
  has_secure_password
  has_many :time_sheets, dependent: :destroy
end
