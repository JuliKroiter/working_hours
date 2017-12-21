class Restaurant < ApplicationRecord
  include WorkingHoursConcern

  has_many :tables
end
