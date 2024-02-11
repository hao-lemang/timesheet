class User < ApplicationRecord
  has_secure_password
  has_many :time_sheets, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
end
