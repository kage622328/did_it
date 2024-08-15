class List < ApplicationRecord
  belongs_to :child
  has_many :tasks, dependent: :destroy
  
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank, limit: 4

  validates :name, presence: true, length: { maximum: 10 }
  validates :name, uniqueness: { scope: :child_id }

  validate :lists_limit
  
  enum status: { incomplete: 0, completed: 1 }
  
  private

  def lists_limit
    if child.lists.size > 3
      errors.add(:lists, "は3個まで登録できます")
    end
  end
end
