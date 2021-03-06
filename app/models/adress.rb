class Adress < ApplicationRecord
  validates :zip_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true

  belongs_to :user
end
