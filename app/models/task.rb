class Task < ApplicationRecord
  belongs_to :list
  
  validates :body, presence: true, length: { maximum: 10 }

  enum status: { incomplete: 0, completed: 1 }
end
