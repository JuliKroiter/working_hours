class Reserve < ApplicationRecord
  belongs_to :table

  delegate :restaurant, to: :table, allow_nil: true

  validate  :working_hours, :registration_time

  def working_hours
    unless restaurant.in_working_hours?(start_at)
      errors.add(:restaurant_closed, "In the selected period restaurant closed")
    end
  end

  def registration_time
    if table.busy?(start_at, end_at)
      errors.add(:table_busy, "In the selected period the table is busy")
    end
  end
end
