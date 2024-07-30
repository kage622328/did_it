class Task < ApplicationRecord
  has_many :list_tasks, dependent: :destroy
  has_many :completed_tasks, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 10 }

  enum status: { incomplete: 0, completed: 1 }
end
