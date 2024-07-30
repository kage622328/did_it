class ListTask < ApplicationRecord
  belongs_to :list
  belongs_to :task

  validates : task_id, uniqueness: { scope: :list_id }
end
