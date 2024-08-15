class List < ApplicationRecord
  belongs_to :child
  has_many :tasks, dependent: :destroy
  
  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :name, presence: true, length: { maximum: 10 }
  validates :name, uniqueness: { scope: :child_id }
  
  enum status: { incomplete: 0, completed: 1 } 
end
