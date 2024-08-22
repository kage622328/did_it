class List < ApplicationRecord
  belongs_to :child
  has_many :tasks, dependent: :destroy
  
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank, limit: 4

  validates :name, presence: true, length: { maximum: 10 }

  scope :created_at_today, -> { where(created_at: Time.current.all_day) }
  
  enum status: { incomplete: 0, completed: 1 }
  
end
