class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
