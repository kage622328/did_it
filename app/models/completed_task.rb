class CompletedTask < ApplicationRecord
  belongs_to :child

  validates :task_body, uniqueness: { scope: :child_id }
end
