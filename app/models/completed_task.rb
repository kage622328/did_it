class CompletedTask < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates :task_id, uniqueness: { scope: :list_id }
end
