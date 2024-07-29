class List < ApplicationRecord
  belongs_to :child

  validates :name, presence: true, length: { maximum: 10 }, 
  
  enum status: { incomplete: 0, completed: 1 } 
end
