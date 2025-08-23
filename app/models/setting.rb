class Setting < ApplicationRecord
  validates :default_deadline_days, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }
  validates :default_deadline_hours, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
  validates :default_deadline_minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
end
