class Todo < ApplicationRecord
  enum :status, { wait: 0, doing: 1, done: 2 }
  validates :task, :deadline, presence: true
end
