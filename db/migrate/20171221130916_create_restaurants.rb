class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :restaurants do |t|
      t.hstore :working_hours, default: {}

      t.timestamps
    end
  end
end
