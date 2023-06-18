class Chicken < ApplicationRecord
  belongs_to :farm

  GENDER = ['female', 'male']
  validates :gender, inclusion: { in: GENDER }
end
