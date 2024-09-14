class Shift < ApplicationRecord
  has_many :productions
  has_many :users
end
