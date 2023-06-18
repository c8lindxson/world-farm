class Farm < ApplicationRecord
  has_many :chickens, dependent: :destroy
  has_many :cows, dependent: :destroy
  has_many :tomatoes, dependent: :destroy
  has_many :wheats, dependent: :destroy

  validates :name, presence: true
end
