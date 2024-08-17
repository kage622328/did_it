class Coin < ApplicationRecord
  belongs_to :child

  validates :child_id, uniqueness: true
end
