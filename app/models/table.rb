class Table < ApplicationRecord
  belongs_to :restaurant

  has_many :reserves, class_name: 'Reserve'

  def busy?(start_at, end_at)
    reserves.where('reserves.start_at BETWEEN ? AND ? OR reserves.end_at BETWEEN ? AND ?',
                   start_at, end_at, start_at, end_at).any?
  end
end
