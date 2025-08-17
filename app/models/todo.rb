class Todo < ApplicationRecord
  validates :task, :deadline, presence: true
end
