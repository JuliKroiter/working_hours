class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.belongs_to :table
      t.datetime   :start_at
      t.datetime   :end_at

      t.timestamps
    end
  end
end
